function [data, auxData, metaData, txtData, weights] = mydata_Calotomus_japonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Calotomus_japonicus'; 
metaData.species_en = 'Japanese parrotfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 27];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KumeKubo2010';   
  temp.am = C2K(20.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Lim  = 39;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 1.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.66 mm: pi/6*0.066^3'; 
data.Wwp = 157.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02089*Lp^2.98, see F1';
data.Wwi = 1.15e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.98, see F1';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'KumeKubo2010';
  temp.GSI = C2K(20.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.994	31.441
1.995	32.206
2.001	24.681
2.002	27.232
2.003	29.528
2.004	30.293
2.005	33.100
2.013	26.467
2.014	28.125
2.996	25.861
2.997	33.769
2.998	35.937
2.999	38.744
3.005	26.499
3.006	27.519
3.007	29.433
3.008	32.621
3.009	34.790
3.018	36.831
3.019	37.469
3.027	28.413
3.028	30.964
3.991	31.887
4.000	29.464
4.001	31.122
4.002	35.459
4.003	36.607
4.004	42.347
4.013	39.159
4.014	40.307
4.022	34.184
4.032	33.164
4.976	35.745
4.977	39.062
4.986	36.639
4.996	38.297
5.005	32.940
5.007	40.593
5.008	43.782
5.009	45.185
5.016	34.854
5.028	42.635
5.981	42.283
5.990	39.222
5.991	42.793
5.992	44.579
5.993	48.916
6.000	38.074
6.001	43.559
6.012	47.130
6.013	48.023
6.031	41.264
6.986	48.692
6.995	45.631
6.996	48.055
7.005	43.463
7.006	46.142
7.980	49.234
8.000	47.832
8.019	45.409
8.029	42.475];
data.tL(:,1) = 365*(0+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KumeKubo2010'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'Q4D7'; % Cat of Life
metaData.links.id_ITIS = '170873'; % ITIS
metaData.links.id_EoL = '46572729'; % Ency of Life
metaData.links.id_Wiki = 'Calotomus_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Calotomus_japonicus'; % ADW
metaData.links.id_Taxo = '165246'; % Taxonomicon
metaData.links.id_WoRMS = '276710'; % WoRMS
metaData.links.id_fishbase = 'Calotomus-japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calotomus_japonicus}}';
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
bibkey = 'KumeKubo2010'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-009-0135-9}, ' ...
'author = {Gen Kume and Yoichiro Kubo and Taku Yoshimura and Takanari Kiriyama and Atsuko Yamaguchi}, ' ... 
'year = {2010}, ' ...
'title = {Life history characteristics of the protogynous parrotfish \emph{Calotomus japonicus} from northwest {K}yushu, {J}apan}, ' ...
'journal = {Ichthyol. Res.}, ' ...
'volume = {57}, ' ...
'pages = {113–120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Calotomus-japonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

