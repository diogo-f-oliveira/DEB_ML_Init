function [data, auxData, metaData, txtData, weights] = mydata_Cuon_alpinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Cuon_alpinus'; 
metaData.species_en = 'Dhole';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTs','0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JXi'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 01 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 01 22]; 

%% set data
% zero-variate data

data.tg = 61;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 58;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.1*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 275;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 2350;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 15e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '10 to 17 kg';
data.Wwim = 19e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '15 to 21 kg';
  
data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 pups per litter, 1 litter per yr';

data.JXi  = 1e3;   units.JXi  = '#/d'; label.JXi  = 'ultimate feeding rate';     bibkey.JXi  = 'MaisRixt2017';   
  temp.JXi = C2K(38.8);  units.temp.JXi = 'K'; label.temp.JXi = 'temperature';

% uni-variate data
% time-weight
data.tWw = [ % time since birth (wk), wet weight (g) for male, male, female
    1   476   246   270
    2   730   510   570
    3   930   670   750
    4  1240   990  1010
    5  1600  1040  1280
    6  2050  1690  1770
    7  2500  2230  2280
    8  3000  2800  2740
    9  3460  3250  3200
   10  3700  3500  3450
   11  4200  4150  3900
   12  4460  4680  4200
   13  5060  5250  4920
   14  5590  5800  5500
   15  6360  6900  5900
   16  7010  7950  4700
   17  7120  8220  5020
   18  8200  9100  5150
   19  8350  9390  6100
   20  8860  9850  7100
   21  9310 10450  7500
   22  9950 11750  8400
   23 10820 12350  9200
   24 10570 12450  9050
   25 11270 13050 10000
   26 11370 12950 10000]; 
data.tWw(:,1) = 7 * data.tWw(:,1); data.tWw = data.tWw(:,[1 4 2 3]); % female first
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'total weight'};  
temp.tWw  = C2K(38.8);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
treat.tWw  = {1, {'f', 'm', 'm'}};  units.treat.tWw = '-'; label.treat.tWw = 'gender';
bibkey.tWw = 'Hash1984';
comment.tWw  = 'Data for female, 2 males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend not to differ from females by {p_Am} only';
D2 = 'Typical body temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6C3NM'; % Cat of Life
metaData.links.id_ITIS = '183831'; % ITIS
metaData.links.id_EoL = '328688'; % Ency of Life
metaData.links.id_Wiki = 'Cuon_alpinus'; % Wikipedia
metaData.links.id_ADW = 'Cuon_alpinus'; % ADW
metaData.links.id_Taxo = '66505'; % Taxonomicon
metaData.links.id_WoRMS = '1526002'; % WoRMS
metaData.links.id_MSW3 = '14000793'; % MSW3
metaData.links.id_AnAge = 'Cuon_alpinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cuon_alpinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hash1984'; type = 'techreport'; bib = [ ... 
'author = {Hashikawa, Yoshiyuki}, ' ... 
'year = {1984}, ' ...
'title = {The growth rate of the dhole''s puppies when parent reared}, ' ...
'institution = {Yokohama Nogeyama Zoological Garden}, ' ...
'pages = {26-31},' ...
'howpublished = {Manuscript obtained via Dr. Heike Maisch}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaisRixt2017'; type = 'techreport'; bib = [ ... 
'author = {Heike Maisch and Nynke Rixt Vellinga and Hindrik Boersma}, ' ... 
'year = {2017}, ' ...
'title = {Best Practice Guideline Dhole (\emph{C. alpinus})}, ' ...
'institution = {Thueringer Zoopark Erfurt}, ' ...
'pages = {26-31},' ...
'howpublished = {Manuscript obtained via Dr. Heike Maisch}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cuon_alpinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cuon_alpinus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

