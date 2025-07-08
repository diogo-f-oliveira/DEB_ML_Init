function [data, auxData, metaData, txtData, weights] = mydata_Gulo_gulo
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Gulo_gulo'; 
metaData.species_en = 'Wolverine'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv', 'xiSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 08 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2018 08 30];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 35;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 87;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 710;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 776;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19.5*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 94;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'BlomLars1990';
data.Wwi  = 25e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight for females'; bibkey.Wwi  = 'Wiki';
data.Wwim = 32e3;   units.Wwim  = 'g';  label.Wwim  = 'ultimate wet weight for males'; bibkey.Wwim  = 'Wiki';

data.Ri  = 0.5*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter, 0.5 litters per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (mnth), weight (g)
  0     94
  1    875
  1.5 1455
  2   2173
  2.5 2667
  3   3706
  3.5 5370
  4   6533
  5   7600];
data.tW(:,1) = 30.5 * data.tW(:,1); % convert mnth to d
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BlomLars1990';

% time-weight females/males
data.tW_f = [  ... % time since birth (d), weight (g)
 45  1550
 50  1670
 55  2050
 60  2290
 65  2370
 70  2650
 75  2920
 80  3030
 85  3620
 90  4160
 95  4000
103  5370
113  6050
123  6200
133  6300
148  7600
515 10000];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(37);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'ShilTama1981';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
 45  2000
 50  2460
 55  2650
 60  3000
 65  3320
 70  3710
 75  4240
 80  4330
 85  5100
 90  5920
 95  5920
103  6800
113  7850
123  7950
133  8000
148 10200
515 17000];
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(37);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'ShilTama1981';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 2 * weights.tW;
weights.tW_f(end) = 0; weights.tW_m(end) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: inclusion of tW_f and tW_m data, but last data-point is ignored';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'The implantation can be delayed; gestation time up to 120 or 272 d';
metaData.bibkey.F1 = 'AnAge'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3HLZN'; % Cat of Life
metaData.links.id_ITIS = '925583'; % ITIS
metaData.links.id_EoL = '328585'; % Ency of Life
metaData.links.id_Wiki = 'Gulo_gulo'; % Wikipedia
metaData.links.id_ADW = 'Gulo_gulo'; % ADW
metaData.links.id_Taxo = '66650'; % Taxonomicon
metaData.links.id_WoRMS = '1460001'; % WoRMS
metaData.links.id_MSW3 = '14001166'; % MSW3
metaData.links.id_AnAge = 'Gulo_gulo'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gulo_gulo}}';
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
bibkey = 'BlomLars1990'; type = 'Article'; bib = [ ... 
'author = {L. Blomqvist and H.-O. Larsson}, ' ... 
'year = {1990}, ' ...
'title = {Breeding the wolverine (\emph{Gulo gulo} in {scandinavia Zoos})}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {29}, ' ...
'pages = {156--163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShilTama1981'; type = 'Article'; bib = [ ... 
'author = {R. A. Shilo and M. A. Tamarovskaya}, ' ... 
'doi = {10.1111/j.1748-1090.1981.tb01969.x}, ' ...
'year = {1981}, ' ...
'title = {Growth and development of wolverine (\emph{Gulo gulo} at {N}ovobirsk {Z}oo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {21}, ' ...
'pages = {146--147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gulo_gulo}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

