function [data, auxData, metaData, txtData, weights] = mydata_Dicrostonyx_groenlandicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Dicrostonyx_groenlandicus'; 
metaData.species_en = 'Northern collared lemming'; 

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2017 12 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 30]; 

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 16;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 40;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 85;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.35;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwx = 23;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';         bibkey.Wwx = 'AnAge';
data.Wwi = 59; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'AnAge';
data.Wwim = 75; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';            bibkey.Wwim = 'ADW';
comment.Wwim = '30 till 112 g';

data.Ri  = 3.4*8.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.4 pups per litter; 8.5 litters per yr';
 
% uni-variate data
% t-W data
data.tW_f = [ ... % time since weaning (d), weight (g)
 0.000	21.046
14.157	38.598
28.005	47.539
41.890	52.755
55.984	52.575
70.055	54.580];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since weaning', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GoweNagy1994';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since weaning (d), weight (g)
 0.000	20.410
14.064	38.888
27.839	49.396
41.916	60.163
55.905	65.790
69.901	70.903];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since weaning', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GoweNagy1994';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '35TZZ'; % Cat of Life
metaData.links.id_ITIS = '180328'; % ITIS
metaData.links.id_EoL = '328424'; % Ency of Life
metaData.links.id_Wiki = 'Dicrostonyx_groenlandicus'; % Wikipedia
metaData.links.id_ADW = 'Dicrostonyx_groenlandicus'; % ADW
metaData.links.id_Taxo = '62581'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000190'; % MSW3
metaData.links.id_AnAge = 'Dicrostonyx_groenlandicus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dicrostonyx_groenlandicus}}';
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
bibkey = 'GoweNagy1994'; type = 'Article'; bib = [ ... 
'author = {B. A. Gower and T. R. Nagy and M. H. Stetson}, ' ... 
'year = {1994}, ' ...
'title = {Pre- and postnatal effects of photoperiod on collard lemmings (\emph{Dicrostonyx groenlandicus})}, ' ...
'howpublished = {\url{https://folk.uio.no/atlemy/pdf/art20.pdf}}, ' ...
'journal = {The American journal of physiology}, ' ...
'volume = {267}, ' ...
'pages = {R879--887}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dicrostonyx_groenlandicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Dicrostonyx_groenlandicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

