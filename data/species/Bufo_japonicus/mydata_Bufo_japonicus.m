function [data, auxData, metaData, txtData, weights] = mydata_Bufo_japonicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Bufo_japonicus'; 
metaData.species_en = 'Japanese common toad'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 8;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Anaxyrus americanus';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;  units.tpm = 'd';    label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'amphibiaweb';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 3.5;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'amphibiaweb'; 
data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'KusaMaru2010','amphibiaweb'};
  comment.Lp = 'based on tp and tW_f data';
data.Li  = 17.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';
data.Lim  = 15;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'guess';
  comment.Lim = 'based on "females are a little larger than males"';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on Anaxyrus americanus';
data.Wwi = 417;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bufo bufo';
data.Wwim = 262;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi: (15/17.5)^3*417';
  
data.Ri  = 9*365/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '1500-14000 eggs per clutch';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since hatch, body length (mm)
3.071	14.147
3.116	12.672
3.127	13.971
3.183	13.454
4.043	12.382
4.135	14.576
4.138	13.265
4.220	13.429
4.221	12.861
4.261	13.693
5.020	14.324
5.103	14.374
5.270	13.845
5.283	14.097
6.003	13.870
6.085	14.286
6.156	13.328
6.168	13.958
6.266	13.718
7.028	12.849
7.055	13.189
7.163	14.185
7.191	14.273
7.206	13.655
7.247	13.908
7.272	14.929];
data.tL_f(:,1) = (data.tL_f(:,1) + 1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL'};  
temp.tL_f    = C2K(12);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KusaMaru2010';
%
data.tL_m = [ ... % time since hatch, body length (mm)
1.102	10.529
1.144	10.630
1.202	9.395
1.310	10.668
2.008	13.630
2.157	14.815
3.046	13.113
3.071	14.349
3.076	12.218
3.093	10.731
3.104	11.903
3.143	12.861
3.156	13.176
3.160	11.500
3.189	11.071
3.239	13.366
3.270	11.803
3.280	13.315
4.011	14.097
4.041	13.214
4.042	13.151
4.055	12.962
4.067	13.920
4.136	14.021
4.179	13.151
4.180	12.950
4.184	11.248
4.185	11.034
4.192	13.857
4.193	13.807
4.220	13.567
4.234	13.315
4.237	12.067
4.263	12.748
4.985	11.462
4.996	12.824
5.051	12.950
5.052	12.647
5.060	15.029
5.091	13.668
5.093	12.584
5.133	13.315
5.202	13.164
5.216	13.303
5.220	11.702
5.254	14.853
5.282	14.462
5.302	12.130
5.975	13.794
5.988	14.172
5.999	15.332
6.005	12.761
6.101	13.139
6.166	14.878
6.172	12.319
6.195	14.235
6.209	14.071
6.225	13.441
6.249	14.878
6.281	13.252
6.286	16.857
7.054	13.756
7.109	13.819
7.127	12.055
7.165	13.265
8.034	14.046
8.075	14.475
8.271	13.252
8.281	15.004];
data.tL_m(:,1) = (data.tL_m(:,1) + 1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL'};  
temp.tL_m    = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KusaMaru2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'NP7S'; % Cat of Life
metaData.links.id_ITIS = '1107088'; % ITIS
metaData.links.id_EoL = '130062'; % Ency of Life
metaData.links.id_Wiki = 'Bufo_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Bufo_japonicus'; % ADW
metaData.links.id_Taxo = '137248'; % Taxonomicon
metaData.links.id_WoRMS = '1488229'; % WoRMS
metaData.links.id_amphweb = 'Bufo+japonicus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Bufo_bufo'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bufo_japonicus}}';
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
bibkey = 'KusaMaru2010'; type = 'Article'; bib = [ ... 
'author = {Tamotsu Kusano and Kazuko Maruyama and Shigenori Kaneko}, ' ... 
'year = {2010}, ' ...
'title = {Body Size and Age Structure of a Breeding Population of the {J}apanese Common Toad, \emph{Bufo japonicus formosus} {A}mphibia: {B}ufonidae)}, ' ...
'journal = {Current Herpetology}, ' ...
'volume = {29(1)}, ' ...
'pages = {23–31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/130062}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bufo+japonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

