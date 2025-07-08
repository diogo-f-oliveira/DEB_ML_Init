function [data, auxData, metaData, txtData, weights] = mydata_Bothrops_insularis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Bothrops_insularis'; 
metaData.species_en = 'Golden lancehead'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.tp = 365;  units.tp = 'd';    label.tp = 'time since borth at puberty';        bibkey.tp = 'TravZela2010';   
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 16.1*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 22;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';      bibkey.Lb  = 'TravZela2010';
data.Li  = 135;    units.Li  = 'cm';  label.Li  = 'ultimate SVL of females';  bibkey.Li  = 'TravZela2010';
data.Lim  = 85;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL of males';  bibkey.Lim  = 'TravZela2010';

data.Wwb = 9;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'TravZela2010';
  comment.Wwb = '7.8 to 10 g';
  
data.Ri  = 6.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'TravZela2010';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f1 = [ ... % time since birth (yr), SVL (cm)
0.000	22.821
1.016	29.763
2.015	64.006
2.996	82.648
4.012	94.992
4.994	96.234];
data.tL_f1(:,1) = data.tL_f1(:,1) * 365; % convert yr to d
units.tL_f1  = {'d', 'cm'};  label.tL_f1 = {'time since birth', 'SVL', 'female'};  
temp.tL_f1   = C2K(24);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'TravZela2010';
comment.tL_f1 = 'Data for female 1';
%
data.tL_f2 = [ ... % time since birth (yr), SVL (cm)
0.000	23.421
1.024	38.463
2.006	67.306
2.996	89.848
4.012	102.792
5.002	106.434
5.976	113.376
6.958	114.318];
data.tL_f2(:,1) = data.tL_f2(:,1) * 365; % convert yr to d
units.tL_f2  = {'d', 'cm'};  label.tL_f2 = {'time since birth', 'SVL', 'female'};  
temp.tL_f2   = C2K(24);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'TravZela2010';
comment.tL_f2 = 'Data for female 2';
%
data.tL_f3 = [ ... % time since birth (yr), SVL (cm)
0.000	22.521
1.016	49.863
2.015	65.506
2.996	79.648
4.004	82.091
4.994	90.534
5.976	92.376
6.975	93.918];
data.tL_f3(:,1) = data.tL_f3(:,1) * 365; % convert yr to d
units.tL_f3  = {'d', 'cm'};  label.tL_f3 = {'time since birth', 'SVL', 'female'};  
temp.tL_f3   = C2K(24);  units.temp.tL_f3 = 'K'; label.temp.tL_f3 = 'temperature';
bibkey.tL_f3 = 'TravZela2010';
comment.tL_f3 = 'Data for female 1';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.025	23.421
1.024	29.463
2.015	65.806
3.013	71.549
3.995	74.291
4.985	74.033
5.976	74.976
6.958	76.218];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TravZela2010';
comment.tL_m = 'Data for male';

% time-weight
data.tW_f1 = [ ... % time since birth (yr), weight (g)
0.000	6.121
0.986	10.720
1.988	119.756
2.974	326.677
4.010	540.486
4.987	560.745];
data.tW_f1(:,1) = data.tW_f1(:,1) * 365; % convert yr to d
units.tW_f1  = {'d', 'g'};  label.tW_f1 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f1   = C2K(24);  units.temp.tW_f1 = 'K'; label.temp.tW_f1 = 'temperature';
bibkey.tW_f1 = 'TravZela2010';
comment.tW_f1 = 'Data for female 1';
%
data.tW_f2 = [ ... % time since birth (yr), weight (g)
0.000	6.664
0.986	37.288
2.013	164.682
2.982	426.920
4.001	588.886
4.995	702.469
5.998	836.789
7.008	1247.647];
data.tW_f2(:,1) = data.tW_f2(:,1) * 365; % convert yr to d
units.tW_f2  = {'d', 'g'};  label.tW_f2 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f2   = C2K(24);  units.temp.tW_f2 = 'K'; label.temp.tW_f2 = 'temperature';
bibkey.tW_f2 = 'TravZela2010';
comment.tW_f2 = 'Data for female 2';
%
data.tW_f3 = [ ... % time since birth (yr), weight (g)
0.000	3.207
0.994	47.655
1.996	112.839
2.990	267.903
3.993	312.347
4.987	474.325
5.989	491.114
6.992	518.273];
data.tW_f3(:,1) = data.tW_f3(:,1) * 365; % convert yr to d
units.tW_f3  = {'d', 'g'};  label.tW_f3 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f3   = C2K(24);  units.temp.tW_f3 = 'K'; label.temp.tW_f3 = 'temperature';
bibkey.tW_f3 = 'TravZela2010';
comment.tW_f3 = 'Data for female 3';
%
data.tW_m = [ ... % time since birth (yr), weight (g)
0.008	6.660
1.002	23.453
1.988	119.756
2.999	146.911
4.001	156.787
4.987	187.411
5.998	204.196
6.983	224.450];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(24);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'TravZela2010';
comment.tW_m = 'Data for male';

% length-weight
data.LW_f = [[data.tL_f1(:,2);data.tL_f2(:,2);data.tL_f3(:,2)], [data.tW_f1(:,2);data.tW_f2(:,2);data.tW_f3(:,2)]]; 
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'female'};  
bibkey.LW_f = 'TravZela2010';
comment.LW_f = 'Data for female';
%
data.LW_m = [data.tL_m(:,2), data.tW_m(:,2)]; 
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'male'};  
bibkey.LW_m = 'TravZela2010';
comment.LW_m = 'Data for male';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f2 = 3 * weights.tL_f2;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1','tL_f2','tL_f3','tL_m'}; subtitle1 = {'Data for female 1,2,3, male'};
set2 = {'tW_f1','tW_f2','tW_f3','tW_m'}; subtitle2 = {'Data for female 1,2,3, male'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'retileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'MNY4'; % Cat of Life
metaData.links.id_ITIS = '634865'; % ITIS
metaData.links.id_EoL = '52233801'; % Ency of Life
metaData.links.id_Wiki = 'Bothrops_insularis'; % Wikipedia
metaData.links.id_ADW = 'Bothrops_insularis'; % ADW
metaData.links.id_Taxo = '50371'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Bothrops&species=insularis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bothrops_insularis}}';
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
bibkey = 'TravZela2010'; type = 'Article'; bib = [ ... 
'doi = {10.11609/JoTT.o2369.1177-84}, ' ...
'author = {Silvia Regina Travaglia-Cardoso and Andr\''{e} Zelanis and Maria de F\''{a}tima Domingues Furtado}, ' ... 
'year = {2010}, ' ...
'title = {Sexual dimorphism in development and venom production of the insular threatened pit viper \emph{Bothrops insularis} ({S}erpentes: {V}iperidae) of {Q}ueimada {G}rande {I}sland, {B}razil}, ' ...
'journal = {Journal of Threatened Taxa}, ' ...
'volume = {2(10)}, ' ...
'pages = {1177-1184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Bothrops&species=insularis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

