function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_porosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_porosus'; 
metaData.species_en = 'Daruma pond frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiFm', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 25];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 2.3*30.5; units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'MatsKhon2002';
  temp.tj = C2K(28);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'MatsKhon2002';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365; units.tpm = 'd';    label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'MatsKhon2002';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MatsKhon2002';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 2.7;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'MatsKhon2002';
data.Lp  = 5.76;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'MatsKhon2002';
data.Lpm  = 4.3;  units.Lpm  = 'cm'; label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'MatsKhon2002';
data.Li  = 8.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'MatsKhon2002';
data.Lim = 5.94;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL';           bibkey.Lim  = 'MatsKhon2002';  

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwj = 2;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'guess';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 19.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwj = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 62.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_esculentus (8.5/9.5)^3*87.5';

data.Ri = 5e3/365; units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pelophylax_esculentus';

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.179	2.472
0.179	2.590
0.179	2.682
0.186	2.800
0.187	3.101
0.193	2.918
0.354	4.110
0.993	5.409
0.995	3.773
0.997	4.414
0.997	4.519
0.997	4.572
0.998	4.820
0.999	5.305
0.999	5.514
1.000	5.619
1.003	4.310
1.004	4.938
1.053	4.009
1.995	4.642
2.006	6.776
2.039	7.117
2.188	5.612
2.189	6.228
2.192	7.210
2.997	6.415
3.037	7.423
3.191	8.040
4.045	9.144];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MatsKhon2002'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.336	4.359
0.998	4.990
1.002	3.891
1.035	4.244
1.041	4.153
1.196	5.332
2.195	5.835
3.008	5.787
4.000	6.119];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'males'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MatsKhon2002'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '76CHQ'; % Cat of Life
metaData.links.id_ITIS = '775194'; % ITIS
metaData.links.id_EoL = '331271'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_porosus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_porosus'; % ADW
metaData.links.id_Taxo = '996610'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelophylax_porosus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_porosus}}';
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
bibkey = 'MatsKhon2002'; type = 'Article'; bib = [ ... 
'doi = {10.1163/15685380260449144}, ' ...
'author = {Matsui, Masafumi and Khonsue, Wichase and Misawa, Yasuchika}, ' ... 
'year = {2002}, ' ...
'title = {Age determination of {D}aruma pond frog, \emph{Rana porosa brevipoda} from {J}apan towards its conservation ({A}mphibia: {A}nura}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {23(3)}, ' ...
'pages = {259–268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pelophylax+porosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
