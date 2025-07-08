function [data, auxData, metaData, txtData, weights] = mydata_Acomys_cahirinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Acomys_cahirinus'; 
metaData.species_en = 'Cairo spiny mouse'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','t-Wwe'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 38;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Brun1990';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Brun1990';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 58;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'Brun1990';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 59;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = {'AnAge','Brun1990'};
  temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.27; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwx = 15.16;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';        bibkey.Wwx = 'AnAge';
data.Wwi = 45.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'AnAge';

data.Ri  = 3.5*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 3.5 litters per yr';
   
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
 0	6.603
20	13.206
40	25.023
60	35.229];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = 'Brun1990';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
 0	6.697
20	14.818
40	26.161
60	35.988];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = 'Brun1990';
comment.tW_m = 'Data for males';
%
data.tW_e = [ ... % age (d), foetal weight (g)
16.029	0.054
18.253	0.095
20.535	0.163
22.845	0.353
25.127	0.569
27.380	0.976
29.690	1.573
32.000	4.325];
units.tW_e   = {'d', 'g'};  label.tW_e = {'age', 'foetal weight'};  
temp.tW_e    = C2K(38.2);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature'; 
bibkey.tW_e = 'Brun1990';
comment.tW_e = 'Data for foetus';
subtitle.tW_e = 'foetal development';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_e = 5 * weights.tW_e;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '7QBD2'; % Cat of Life
metaData.links.id_ITIS = '585099'; % ITIS
metaData.links.id_EoL = '1037942'; % Ency of Life
metaData.links.id_Wiki = 'Acomys_cahirinus'; % Wikipedia
metaData.links.id_ADW = 'Acomys_cahirinus'; % ADW
metaData.links.id_Taxo = '62902'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001002'; % MSW3
metaData.links.id_AnAge = 'Acomys_cahirinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acomys_cahirinus}}';
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
bibkey = 'Brun1990'; type = 'Article'; bib = [ ... 
'author = {P. C. Brunjes}, ' ... 
'year = {1990}, ' ...
'title = {The precocial mouse, \emph{Acomys cahirinus}}, ' ...
'journal = {Psychobiology}, ' ...
'volume = {18}, ' ...
'number = {3}, ' ...
'pages = {339-350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Acomys_cahirinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

