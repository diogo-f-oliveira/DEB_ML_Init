function [data, auxData, metaData, txtData, weights] = mydata_Symphodus_mediterraneus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Symphodus_mediterraneus'; 
metaData.species_en = 'Axillary wrasse'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 13];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SkelBrci2015';   
  temp.am = C2K(10.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '7 to 10 cm';
data.Li  = 18;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 8.1;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.06, see F1';
data.Wwi = 67.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.06, see F1';

data.GSI = 0.16;  units.GSI = '-';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'guess';   
  temp.GSI = C2K(10.7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Symphodus melops';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
0.507	5.090
0.973	7.102
0.990	7.276
0.990	7.451
0.991	8.570
0.998	6.804
0.998	7.784
0.999	7.923
0.999	8.413
1.000	9.619
1.007	7.644
1.007	8.011
1.007	8.186
1.978	8.468
1.980	10.671
1.995	8.276
1.995	8.608
1.995	8.678
1.995	8.940
1.996	9.360
1.996	9.570
1.996	9.744
2.004	9.045
2.004	9.465
2.005	10.059
2.005	10.916
2.011	8.119
2.013	9.849
2.015	11.825
2.021	8.870
2.021	9.185
2.992	9.782
2.992	10.202
2.993	11.583
2.993	11.740
3.001	10.726
3.001	10.971
3.001	11.024
3.002	11.408
3.002	12.265
3.009	10.482
3.010	10.866
3.018	10.377
3.019	11.915
3.034	10.010
3.980	11.149
4.005	10.904
4.006	11.621
4.006	11.848
4.023	11.971
5.003	13.127];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(10.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SkelBrci2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
0.492	7.362
0.492	7.852
0.500	7.537
0.991	8.850
0.993	10.860
0.999	8.693
1.000	9.287
1.000	9.811
1.001	10.301
1.009	10.161
1.010	11.280
1.016	9.077
1.990	12.559
1.991	13.328
1.999	12.874
1.999	13.521
2.005	10.461
2.006	11.196
2.007	12.682
2.007	13.258
2.008	13.678
2.013	10.199
2.015	12.367
2.023	12.122
2.031	10.741
2.031	11.056
2.040	11.703
2.994	12.947
2.995	13.628
2.995	13.978
2.996	14.887
3.004	13.821
3.004	14.136
3.004	14.503
3.013	15.447
3.020	13.139
3.020	13.296
3.028	12.632
3.029	13.436];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(10.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SkelBrci2015';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.kap = 5 * weights.psd.kap;

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length weight: Ww in g = 0.00977*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53PK9'; % Cat of Life
metaData.links.id_ITIS = '614239'; % ITIS
metaData.links.id_EoL = '46571682'; % Ency of Life
metaData.links.id_Wiki = 'Symphodus_mediterraneus'; % Wikipedia
metaData.links.id_ADW = 'Symphodus_mediterraneus'; % ADW
metaData.links.id_Taxo = '169984'; % Taxonomicon
metaData.links.id_WoRMS = '273571'; % WoRMS
metaData.links.id_fishbase = 'Symphodus-mediterraneus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Symphodus_mediterraneus}}';
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
bibkey = 'SkelBrci2015'; type = 'Article'; bib = [ ... 
'doi = {10.1080/17451000.2015.1016963}, ' ...
'author = {Frane \v{S{keljo, Jure Br\v{c}i\''{c} and Vedran Vuletin and Josipa Ferri}, ' ... 
'year = {2015}, ' ...
'title = {Age and growth of the axillary wrasse, \emph{Symphodus mediterraneus} ({L}.) from the eastern {A}driatic {S}ea}, ' ...
'journal = {Marine Biology Research}, ' ...
'volume = {11(7)}, ' ...
'pages = {780-784}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symphodus-mediterraneus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

