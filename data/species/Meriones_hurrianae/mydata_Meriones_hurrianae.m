function [data, auxData, metaData, txtData, weights] = mydata_Meriones_hurrianae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Meriones_hurrianae'; 
metaData.species_en = 'Indian desert jird'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 06];              
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

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'KaulRama1969';   
  temp.tg = C2K(38.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '28-32 d';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'KaulRama1969';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'KaulRama1969';
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 50;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = 'guess';
  temp.tpm = C2K(38.2);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'KaulRama1969';
data.Wwi = 80;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';   bibkey.Wwi = 'KaulRama1969';
data.Wwim = 100;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'KaulRama1969';

data.Ri  = 5*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'KaulRama1969';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-7 pups per litter; 3 litters per yr';
   
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
    0  3.4
    5  3.9
    7  7.4
   15  9.2
   20 10.9
   30 20.2
   50 36.5
   60 42.3
   75 51.1];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(38.2);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'KaulRama1969';
comment.tWw_f = 'Data for female';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
    0  3.5
    5  3.8
    7  8.8
   15  9.5
   20 11.0
   30 21.1
   50 32.5];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(38.2);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'KaulRama1969';
comment.tWw_m = 'Data for male';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '7VTBF'; % Cat of Life
metaData.links.id_ITIS = '632979'; % ITIS
metaData.links.id_EoL = '1179757'; % Ency of Life
metaData.links.id_Wiki = 'Meriones_hurrianae'; % Wikipedia
metaData.links.id_ADW = 'Meriones_hurrianae'; % ADW
metaData.links.id_Taxo = '62821'; % Taxonomicon
metaData.links.id_MSW3 = '13001146'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Meriones_hurrianae}}';
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
bibkey = 'KaulRama1969'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1463-6395.1969.tb00543.x}, ' ... 
'author = {Kaul, D. K. and Ramaswami, L. S.}, ' ... 
'year = {1969}, ' ...
'title = {Reproduction in the {I}ndian Desert Gerbil \emph{Meriones hurrianae} Jerdon}, ' ...
'journal = {Acta Zoologica}, ' ...
'volume = {50(3)}, ' ...
'pages = {233–248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

