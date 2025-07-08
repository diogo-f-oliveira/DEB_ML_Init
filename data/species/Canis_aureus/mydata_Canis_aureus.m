function [data, auxData, metaData, txtData, weights] = mydata_Canis_aureus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Canis_aureus'; 
metaData.species_en = 'Golden jackal';

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPi','THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 05 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 15]; 

%% set data
% zero-variate data

data.tg = 63;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 75;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 334;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 110;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DhooUpad2003';
  comment.Wwb = 'ADW give 200-250 g; AnAge gives 207.5 g; DhooUpad2003 gives 107 g, but from a large nest';
data.Wwi = 11e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW: ';
  
data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter, 1 litters per yr';
  
% uni-variate data
% time-weight
data.tWw = [ % time since birth (wk), wet weight (g)
    3 107.50
    7 104.00
   14 122.50
   21 152.50
   28 167.50
   36 206.25
   42 270.00
   49 345.00
   56 433.75
   63 526.25
   70 622.50
   77 745.00
   84 865.00
   90 996.25]; 
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'total weight'};  
temp.tWw  = C2K(38.8);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'DhooUpad2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend not to differ from females, but males are slightly larger';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'QLX7'; % Cat of Life
metaData.links.id_ITIS = '183817'; % ITIS
metaData.links.id_EoL = '328681'; % Ency of Life
metaData.links.id_Wiki = 'Canis_aureus'; % Wikipedia
metaData.links.id_ADW = 'Canis_aureus'; % ADW
metaData.links.id_Taxo = '66405'; % Taxonomicon
metaData.links.id_WoRMS = '1526002'; % WoRMS
metaData.links.id_MSW3 = '14000704'; % MSW3
metaData.links.id_AnAge = 'Canis_aureus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Canis_aureus}}';
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
bibkey = 'DhooUpad2003'; type = 'article'; bib = [ ... 
'author = {V. M. Dhoot and S. V. Upadhye and R. M. Zinjarde and M. R. Paude}, ' ... 
'year = {2003}, ' ...
'title = {Handrearing of jackal (\emph{Canis aureus}) at {M}aharajbag {Z}oo, {N}agpur}, ' ...
'journal = {Zoo''s Print Journal}, ' ...
'volume = {18(1)}, '...
'pages = {995-996}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Canis_aureus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Canis_aureus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

