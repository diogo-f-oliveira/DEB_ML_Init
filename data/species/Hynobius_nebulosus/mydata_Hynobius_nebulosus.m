function [data, auxData, metaData, txtData, weights] = mydata_Hynobius_nebulosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Hynobius_nebulosus'; 
metaData.species_en = 'Clouded salamander'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'L-dL'; 'L-N'; 'T-aj'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 16]; 


%% set data
% zero-variate data

data.ab = 3.5*7;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Kusa1982';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1;      units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Kusa1981';
data.Lj  = 1.8;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'Kusa1981'; 
data.Lp  = 5.5;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'Kusa1982'; 
data.Lpm  = 5;     units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'Kusa1982'; 
data.Li  = 7.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Kusa1982';

data.Wwi = 5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'guess','amphibiaweb'};
  comment.Wwi = 'guess based on Salamandra salamandra of TL 250 mm, weighing 40 g (Wiki), while TL of Hynobius_nebulosus is 125 mm';

% univariate data
% length-change in length
data.LdL_f = [... % total length (cm), change in length (cm/yr)
5.696	0.230
5.724	0.122
6.002	0.127
6.102	0.348
6.499	0.080
6.499	0.107
6.572	0.019
6.591	0.151
6.595	0.109
6.623	0.001
6.704	0.017
6.715	0.004
6.762	0.008
6.796	0.121
6.803	0.072
6.821	0.017
6.850	0.109
6.861	0.006
6.894	0.008
6.993	0.172
7.099	0.005
7.099	0.101
7.301	0.299
7.402	0.010
7.600	0.056];
data.LdL_f(:,2) = data.LdL_f(:,2)/ 365; % convert cm/yr to cm/d
units.LdL_f  = {'cm', 'cm/d'}; label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(15); units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Kusa1982';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [... % total length (cm), change in length (cm/yr)
5.009	0.501
5.109	0.706
5.112	0.499
5.207	0.502
5.309	0.500
5.312	0.302
5.315	0.282
5.396	0.401
5.415	0.581
5.444	0.335
5.596	0.103
5.601	0.353
5.604	0.302
5.611	0.203
5.648	0.305
5.695	0.202
5.699	0.256
5.702	0.001
5.702	0.096
5.712	0.601
5.714	0.155
5.720	0.001
5.742	0.019
5.750	0.200
5.765	0.158
5.797	0.002
5.799	0.399
5.799	0.602
5.802	0.235
5.805	0.052
5.805	0.301
5.808	0.103
5.809	0.351
5.813	0.426
5.831	0.312
5.896	0.105
5.903	0.000
5.903	0.074
5.904	0.275
5.908	0.305
5.940	0.004
5.974	0.303
5.977	0.152
5.995	0.000
6.003	0.251
6.003	0.301
6.006	0.205
6.007	0.279
6.013	0.022
6.013	0.059
6.013	0.169
6.021	0.150
6.031	0.000
6.053	0.022
6.101	0.009
6.105	0.103
6.105	0.304
6.106	0.477
6.112	0.248
6.113	0.400
6.119	-0.002
6.142	0.304
6.160	0.152
6.163	0.132
6.196	0.046
6.199	-0.002
6.201	0.499
6.218	0.011
6.221	0.000
6.222	0.301
6.236	0.051
6.262	0.036
6.280	0.051
6.295	0.099
6.295	0.177
6.306	0.302
6.313	0.054
6.316	0.005
6.318	0.453
6.328	0.172
6.336	0.286
6.339	0.098
6.382	-0.001
6.401	0.273
6.401	0.300
6.404	0.005
6.408	0.102
6.411	0.036
6.412	0.062
6.412	0.124
6.441	0.005
6.477	0.003
6.477	0.012
6.485	0.155
6.500	0.351
6.514	0.054
6.525	0.006
6.533	0.153
6.558	0.003
6.591	0.004
6.603	0.348
6.610	0.421
6.616	0.021
6.675	-0.001
6.701	0.252
6.712	0.101
6.792	0.002
6.818	0.101
6.825	0.002
6.923	0.028
6.931	0.006
7.018	0.004
7.154	0.003
7.311	0.051
7.553	0.118];
data.LdL_m(:,2) = data.LdL_m(:,2)/ 365; % convert cm/yr to cm/d
units.LdL_m  = {'cm', 'cm/d'}; label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(15); units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Kusa1982';
comment.LdL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % SVL (cm), number of eggs per clutch (#)
5.450	29.190
5.612	31.233
5.731	56.087
5.824	49.259
5.830	66.201
5.849	53.199
5.863	47.560
5.912	39.237
5.916	35.065
5.996	46.888
6.047	85.702
6.094	55.284
6.119	59.960
6.202	52.145
6.211	38.893
6.217	57.308
6.253	75.247
6.320	48.275
6.331	63.747
6.335	55.402
6.335	59.330
6.398	45.367
6.414	62.315
6.493	77.329
6.518	71.694
6.536	51.818
6.538	80.297
6.576	58.466
6.577	79.334
6.615	61.186
6.621	70.026
6.659	58.507
6.679	66.127
6.690	78.653
6.753	66.163
6.760	95.381
6.763	73.042
6.836	68.905
6.844	115.308
6.858	98.866
6.861	73.336
6.862	78.737
6.865	58.854
6.939	67.483
7.004	76.598
7.101	69.772
7.235	83.831
7.258	67.639
7.363	85.366
7.363	95.187
7.619	106.605];
units.LN  = {'cm', '#'}; label.LN = {'SVL', 'number of eggs'};  
temp.LN   = C2K(15); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Kusa1982';

% temperature-time since birth at metam
data.Ttj = [ ... % temperature (C), time since birth at metam (d)
9.897	246.592
14.845	112.645
19.916	77.079
25.068	80.434];
units.Ttj  = {'C', 'd'}; label.Ttj = {'temperature', 'time since birth at metam'};  
bibkey.Ttj = 'Kusa1981';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';     
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6MQKZ'; % Cat of Life
metaData.links.id_ITIS = '668216'; % ITIS
metaData.links.id_EoL = '1048033'; % Ency of Life
metaData.links.id_Wiki = 'Hynobius_nebulosus'; % Wikipedia
metaData.links.id_ADW = 'Hynobius_nebulosus'; % ADW
metaData.links.id_Taxo = '47235'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hynobius+nebulosus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Hynobius_nebulosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hynobius_nebulosus}}';
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
bibkey = 'Kusa1981'; type = 'Article'; bib = [ ... 
'author = {T. Kusano}, ' ... 
'year = {1981}, ' ...
'title = {GROWTH AND SURVIVAL RATE OF THE LARVAE OF \emph{Hynobius nebulosus tokyoensis} {T}AGO ({A}MPHIBIA, {H}YNOBIIDAE)}, ' ...
'journal = {Res. Popul. Ecol.}, ' ...
'volume = {23}, ' ...
'pages = {360--378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kusa1982'; type = 'Article'; bib = [ ... 
'author = {T. Kusano}, ' ... 
'year = {1982}, ' ...
'title = {POSTMETAMORPHIC GROWTH, SURVIVAL, AND AGE AT FIRST REPRODUCTION OF THE SALAMANDER, \emph{Hynobius nebulosus tokyoensis} {T}AGO IN RELATION TO A CONSIDERATION ON THE OPTIMAL TIMING OF FIRST REPRODUCTION}, ' ...
'journal = {Res. Popul. Ecol.}, ' ...
'volume = {24}, ' ...
'pages = {329--344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/species/3890}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hynobius_nebulosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

