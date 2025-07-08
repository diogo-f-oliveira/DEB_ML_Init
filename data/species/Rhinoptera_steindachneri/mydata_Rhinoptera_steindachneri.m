function [data, auxData, metaData, txtData, weights] = mydata_Rhinoptera_steindachneri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Rhinoptera_steindachneri'; 
metaData.species_en = 'Golden cownose ray'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 31];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 31]; 

%% set data
% zero-variate data;
data.ab = 12*30.5;    units.ab = 'd';   label.ab = 'age at birth';       bibkey.ab = 'BizzSmit2007';    
  temp.ab = C2K(24.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '11-12 mnth';
data.am = 26*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Neer2005';   
  temp.am = C2K(24.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for R. bonasus';

data.Lb = 40;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'Coli2016';
  comment.Lb = 'BizzSmit2007: DW 38-45 cm';
data.Lp = 70;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'BizzSmit2007'; 
data.Li  = 90;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase'; 

data.Ri  = 1/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
 0	40.342
 1	46.210
 2	50.122
 3	55.208
 4	57.751
 5	70.269
 7	78.875
 9	77.115
10	80.440
11	82.200
12	90.024
13	87.873];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(24.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Coli2016';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
 0	39.169
 1	45.819
 2	47.775
 3	54.817
 4	61.467
 5	61.858
 6	72.225
 7	78.093
 8	75.355
 9	79.462
10	86.308
11	82.200
12	72.225
13	93.154];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(24.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Coli2016';  
comment.tL_m = 'Data for males';

% length - weight
data.LWw_f = [ ... % disc width (cm), wet weight (g)
57.943	2968.982
59.069	2969.467
61.503	3724.826
61.970	4026.751
63.002	4027.196
64.035	4027.641
64.793	2821.072
64.872	5084.036
65.808	5446.509
65.908	4481.035
68.907	5055.604
70.677	7047.746
70.688	5297.750
72.828	8014.190
72.832	7440.916
72.835	7048.676
73.861	7984.463
74.243	6988.938
74.523	7170.093
74.619	6808.065
74.992	7260.812
75.175	7894.512
75.461	7230.842
75.745	6899.068
75.829	8317.207
76.212	7200.993
76.394	7985.555
76.857	8981.444
76.963	7110.800
77.144	8166.912
77.895	8046.546
77.996	7050.901
78.266	8680.327
78.832	8288.330
79.484	9042.921
79.951	9375.019
80.140	9073.376
80.242	7957.041
80.425	8590.740
80.513	9526.123
81.166	10069.508
81.357	9526.487
81.361	8953.213
82.015	9345.736
82.576	9708.047
83.793	10010.296
83.795	9859.434
84.069	10975.931
84.354	10402.779
84.826	10010.741
86.130	11369.062
86.417	10614.875
88.019	9589.703
89.788	11581.845];
units.LWw_f  = {'cm','g'}; label.LWw_f  = {'disc width','wet weight','female'}; 
bibkey.LWw_f  = 'BizzSmit2007';  
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % disc width (cm), wet weight (g)
53.820	2001.687
54.002	2937.110
54.752	3058.123
54.943	2575.446
55.871	4024.122
56.817	2968.496
57.842	3934.455
58.606	2003.750
58.971	3542.700
59.062	3965.154
59.906	4025.862
60.007	2939.698
60.844	4086.611
60.848	3483.164
60.945	3060.793
61.887	2487.922
63.934	5053.460
64.691	4148.614
65.711	5959.398
65.724	3998.197
65.998	5024.177
66.178	6200.979
66.931	5959.924
66.944	3908.206
67.225	4089.361
68.157	5025.108
68.901	5990.945
68.906	5236.638
68.907	5085.776
69.748	5629.241
69.846	5025.836
69.850	4452.561
70.121	5991.471
70.587	6383.914
70.673	7530.503
70.685	5810.680
70.871	5991.795
71.155	5660.021
71.348	4815.276
71.529	5841.216
71.718	5690.436
72.092	5901.804
72.096	5328.530
72.184	6173.395
72.378	5147.617
72.465	6294.206
73.124	5962.594
73.216	6173.840
73.404	6143.749
73.495	6536.029
73.777	6445.633
74.156	5932.866
74.432	6687.296
74.622	6325.309
74.624	6083.930
74.625	6023.585
75.368	7079.940
75.558	6748.125
75.654	6476.615
75.750	6114.587
75.845	5873.249
76.029	6506.949
76.120	6869.058
76.871	6869.381
77.053	7653.942
77.419	9011.859
78.186	6688.913
78.277	7051.022
78.640	8952.040
79.025	7503.930
79.117	7745.349
80.531	6780.442
80.704	8952.929
80.898	8017.669
81.176	8530.719
81.830	8923.243
82.010	10100.044
82.306	8018.275
82.761	10100.368
83.713	8018.882
84.081	9075.075
84.839	8019.367
85.871	8080.157
85.959	8925.023
86.045	10041.439
87.363	9438.559
88.203	10042.369
88.954	10042.692];
units.LWw_m  = {'cm','g'}; label.LWw_m  = {'disc width','wet weight','male'}; 
bibkey.LWw_m  = 'BizzSmit2007';  
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 20 * weights.tL_f;
weights.tL_m = 20 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S9RG'; % Cat of Life
metaData.links.id_ITIS = '564401'; % ITIS
metaData.links.id_EoL = '46561005'; % Ency of Life
metaData.links.id_Wiki = 'Rhinoptera_steindachneri'; % Wikipedia
metaData.links.id_ADW = 'Rhinoptera_steindachneri'; % ADW
metaData.links.id_Taxo = '186053'; % Taxonomicon
metaData.links.id_WoRMS = '271498'; % WoRMS
metaData.links.id_fishbase = 'Rhinoptera-steindachneri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinoptera_steindachneri}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhinoptera-steindachneri}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BizzSmit2007'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2006.10.016}, ' ...
'author = {Joseph J. Bizzarro and Wade D. Smith and J. Fernando M\''{a}rquez-Far\''{i}as and Robert E. Hueter}, ' ...
'year = {2007}, ' ...
'title  = {Artisanal fisheries and reproductive biology of the golden cownose ray, \emph{Rhinoptera steindachneri} {E}vermann and {J}enkins, 1891, in the northern {M}exican {P}acific}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {84}, ' ...
'pages = {137-146}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Coli2016'; type = 'phdthesis'; bib = [ ...  
'author = {Luis Daniel Carrillo Col\''{i}n}, ' ...
'title = {Age and growth of the cownose ray \emph{Rhinoptera steindachneri} in the southeast of the {G}ulf of {C}alifornia}, ' ...
'year = {2016}, ' ...
'school = {Universidad del Mar, Campus Puerto \''{A}ngel, Oaxaca}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Neer2005'; type = 'phdthesis'; bib = [ ...  
'author = {Julie Ann Neer}, ' ...
'title = {Aspects of the life history, ecophysiology, bioenergetics, and population dynamics of the cownose ray, \emph{Rhinoptera bonasus}, in the northern {G}ulf of {M}exico}, ' ...
'year = {2005}, ' ...
'school = {Louisiana State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
