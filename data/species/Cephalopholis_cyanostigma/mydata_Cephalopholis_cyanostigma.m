  function [data, auxData, metaData, txtData, weights] = mydata_Cephalopholis_cyanostigma
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Cephalopholis_cyanostigma'; 
metaData.species_en = 'Bluespotted hind'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 26];

%% set data
% zero-variate data
data.ab = 7.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 35*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'LongLang2011';
data.Li = 55;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 175;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'LongLang2011','fishbase'};
  comment.Wwp = 'based on 0.01349*Lp^3.02, see F1';
data.Wwi = 2432;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.02, see F1';

data.GSI = 0.03; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'ChanSado2002';
  temp.GSI = C2K(28.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_Of = [ ... % time since birth (yr), fork length (cm)
1.915	13.671
2.861	15.799
3.016	16.728
3.033	11.293
3.815	14.746
3.819	13.685
4.925	14.887
5.860	20.594
5.863	19.401
5.924	16.883
5.958	22.982
5.963	21.258
6.060	24.308
6.849	25.507
6.911	22.724
6.914	21.530
6.921	19.277
6.969	20.735
7.859	23.659
7.914	22.996
7.970	21.936
8.029	19.948
8.819	21.147
8.878	18.894
8.912	25.125
8.920	22.606
8.922	21.811
9.873	22.216
9.929	21.156
10.027	23.808
10.874	23.284
10.923	24.610
11.872	25.413
11.877	23.822
11.921	26.871
12.826	24.624
13.989	24.766
14.040	25.429
14.839	23.447
14.843	22.253
14.883	26.496
14.889	24.242
15.895	23.985
15.939	26.769
16.841	25.848
16.944	26.644
18.913	22.284
18.950	27.720
20.014	25.342
21.913	26.947
21.915	26.284
21.970	25.622]; 
data.tL_Of(:,1) = 365 * (0.5+data.tL_Of(:,1)); % convert yr to d
units.tL_Of = {'d', 'cm'};  label.tL_Of = {'time since birth', 'fork length', 'females'};  
temp.tL_Of = C2K(28.3);  units.temp.tL_Of = 'K'; label.temp.tL_Of = 'temperature';
bibkey.tL_Of = 'MossDavi2007'; comment.tL_Of = 'females from Orpheus Island';
%
data.tL_Om = [ ... % time since birth (yr), fork length (cm)
2.971	14.341
2.973	13.679
7.868	20.742
8.910	26.053
8.914	24.727
9.915	25.928
10.819	23.946
11.881	22.364
11.924	25.811
11.928	24.353
12.874	26.481
12.983	25.421
13.939	23.705
13.995	22.777
14.885	25.568
16.000	24.118
17.895	26.784
17.951	25.724
17.993	29.569
18.068	22.013
18.847	26.924
19.906	26.136
19.951	28.788
19.956	27.330
20.124	24.017
20.850	28.795
20.910	26.277
20.968	24.819
21.023	24.024
22.068	28.009
23.077	26.558
23.927	25.239
25.090	25.380
25.931	26.978
30.953	27.281]; 
data.tL_Om(:,1) = 365 * (0.5+data.tL_Om(:,1)); % convert yr to d
units.tL_Om = {'d', 'cm'}; label.tL_Om = {'time since birth', 'fork length', 'females'};  
temp.tL_Om = C2K(28.3);  units.temp.tL_Om = 'K'; label.temp.tL_Om = 'temperature';
bibkey.tL_Om = 'MossDavi2007'; comment.tL_Om = 'males from Orpheus Island'; 
%
data.tL_Pf = [ ... % time since birth (yr), fork length (cm)
2.921	11.944
3.912	15.161
4.016	14.243
4.069	18.489
5.060	15.623
5.216	17.116
5.999	17.348
6.051	22.282
6.103	20.561
6.104	15.741
6.937	20.105
6.938	18.269
6.990	22.974
7.094	25.614
7.928	20.108
8.085	22.174
8.137	19.191
8.867	23.439
8.972	21.259
8.973	19.997
9.024	18.046
10.015	20.000
10.276	21.722
11.006	22.872
11.007	21.840
11.058	21.036
11.110	20.004
11.945	20.466
11.997	22.072
12.049	22.531
12.101	23.335
12.727	23.681
13.092	22.535
13.979	23.341
14.136	25.063
14.970	23.115
15.022	25.295
15.909	22.429
15.961	24.266
16.952	28.515
18.100	23.699
20.969	23.708
21.021	26.807]; 
data.tL_Pf(:,1) = 365 * (0.5+data.tL_Pf(:,1)); % convert yr to d
units.tL_Pf = {'d', 'cm'};  label.tL_Pf = {'time since birth', 'fork length', 'females'};  
temp.tL_Pf = C2K(28.3);  units.temp.tL_Pf = 'K'; label.temp.tL_Of = 'temperature';
bibkey.tL_Pf = 'MossDavi2007'; comment.tL_Pf = 'females from Pelorus Island';
%
data.tL_Pm = [ ... % time since birth (yr), fork length (cm)
4.121	18.833
5.060	18.722
5.894	22.282
5.999	19.528
6.833	21.023
6.990	20.105
7.146	22.171
7.981	21.256
7.982	23.780
8.920	22.521
8.972	19.423
9.754	23.327
9.858	20.803
10.015	25.279
11.058	25.168
11.059	24.135
12.101	24.253
14.031	22.997
15.022	24.607
15.127	24.033
15.128	22.656
16.066	25.069
17.996	26.797
18.100	25.076
20.082	23.935
20.083	22.673
21.073	24.741
22.951	26.469
23.159	24.978]; 
data.tL_Pm(:,1) = 365 * (0.5+data.tL_Pm(:,1)); % convert yr to d
units.tL_Pm = {'d', 'cm'}; label.tL_Pm = {'time since birth', 'fork length', 'females'};  
temp.tL_Pm = C2K(28.3);  units.temp.tL_Pm = 'K'; label.temp.tL_Om = 'temperature';
bibkey.tL_Pm = 'MossDavi2007'; comment.tL_Pm = 'males from Pelorus Island'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Of = 5 * weights.tL_Of;
weights.tL_Om = 5 * weights.tL_Om;
weights.tL_Pf = 5 * weights.tL_Pf;
weights.tL_Pm = 5 * weights.tL_Pm;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Of','tL_Om'}; subtitle1 = {'Data for females, males from Orpheus Island'};
set2 = {'tL_Pf','tL_Pm'}; subtitle2 = {'Data for females, males from Pelorus Island'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69J2L'; % Cat of Life
metaData.links.id_ITIS = '167957'; % ITIS
metaData.links.id_EoL = '46579784'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopholis'; % Wikipedia
metaData.links.id_ADW = 'Cephalopholis_cyanostigma'; % ADW
metaData.links.id_Taxo = '105873'; % Taxonomicon
metaData.links.id_WoRMS = '279147'; % WoRMS
metaData.links.id_fishbase = 'Cephalopholis-cyanostigma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cephalopholis}}';  
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
bibkey = 'MossDavi2007'; type = 'article'; bib = [ ... 
'author = {Mosse, J.W. and C.R. Davies}, ' ... 
'year = {2007}, ' ...
'title = {The extended longevity of small coral reef serranid; a lesson from \emph{Cephalopholis cyanostigma} (blue spot rock cod) of the central {G}reat {B}arrier {R}eef, {A}ustralia}, ' ...
'journal = {Mar. Res. Indonesia}, ' ...
'volume = {32(1)}, ' ...
'pages = {21-33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LongLang2011'; type = 'techreport'; bib = [ ... 
'author = {Ken Longenecker and Ross Langston and Holly Bolick and Utula Kondio}, ' ... 
'year = {2011}, ' ...
'title = {Reproduction, Catch, and Size Structure of Exploited Reef-Fishes at {K}amiali {W}ildlife {M}anagement {A}rea, {P}apua {N}ew {G}uinea }, ' ...
'institution = {Bishop Museum,Honolulu, Hawai''i }, ' ...
'volume = {57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cephalopholis-cyanostigma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

