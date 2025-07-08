function [data, auxData, metaData, txtData, weights] = mydata_Dasyatis_pastinaca
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Dasyatis_pastinaca'; 
metaData.species_en = 'Common stingray'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2018 07 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 0.8*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1350;  units.tp = 'd';   label.tp = 'time since birth at puberty';           bibkey.tp = 'AnAge';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb_DW  = 8;   units.Lb_DW  = 'cm';  label.Lb_DW  = 'disc width at birth';   bibkey.Lb_DW  = 'Wiki';
data.Lb  = 20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';
data.Lp_DWf = 31;   units.Lp_DWf  = 'cm';  label.Lp_DWf  = 'disc width at puberty for females'; bibkey.Lp_DWf  = 'YigiIsme2012';
  comment.Lp_f = '24 till 38 cm';
data.Lp_f = 62.5;   units.Lp_f  = 'cm';  label.Lp_f  = 'total length at puberty for females'; bibkey.Lp_f  = 'YigiIsme2012';
data.Lp_DWm = 29;   units.Lp_DWm  = 'cm';  label.Lp_DWm  = 'disc width at puberty for males'; bibkey.Lp_DWm  = 'YigiIsme2012'; 
  comment.Lp_m = '26 till 32 cm';
data.Lp_m = 62.5;   units.Lp_m  = 'cm';  label.Lp_m  = 'total length at puberty for fmales'; bibkey.Lp_m  = 'YigiIsme2012';
data.Li_DWf  = 140;  units.Li_DWf  = 'cm';  label.Li_DWf  = 'ultimate disc width';   bibkey.Li_DWf  = 'wiki'; 

data.Ri  = 2*6.2/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 till 9 pups per litter, 2 littrs per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time (d), total length (cm)
2.950	37.742
3.985	46.774
3.987	38.065
4.929	51.935
4.930	49.355
4.990	54.516
5.933	63.226
5.934	60.000
5.935	57.097
7.030	67.742
7.883	71.613
7.914	73.548
8.858	77.419
9.864	79.677
9.925	83.548
10.931	84.839
11.906	88.065
11.996	95.806
11.997	92.903
11.997	90.645
12.027	94.516
12.910	99.355
12.911	97.097
13.977	102.581
14.952	108.065
14.953	106.452
14.953	103.226
15.958	113.226
15.958	111.613
15.989	109.677];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(17); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YigiIsme2012'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.937	40.055
3.956	41.538
3.972	45.989
4.975	52.418
4.979	48.214
5.014	53.654
5.916	59.588
5.919	57.115
5.920	55.879
5.935	61.813
5.952	64.286
6.960	65.769
6.961	64.286
7.900	74.176
7.902	71.703
7.903	70.467
8.946	77.143
8.947	76.154
8.948	74.423
9.909	82.582
9.910	82.088
9.972	79.863];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YigiIsme2012'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
37.966	321.875
45.344	614.616
49.034	808.606
51.249	1001.193
51.258	1382.154
55.314	1481.255
56.410	1053.727
58.606	389.152
59.002	1580.005
60.099	1200.097
63.430	1822.318
67.501	2540.480
72.285	2211.703
72.674	3116.835
73.026	2402.885
77.474	3502.359
81.140	2648.708
81.160	3505.869
83.030	4698.127
84.887	5318.943
88.227	6322.124
89.656	4371.104
92.256	5230.723
92.641	5945.375
93.025	6612.407
93.426	8041.361
93.771	6994.070
94.105	5518.198
97.192	11521.138
98.270	10331.689
98.729	14236.887
102.264	7716.445
104.268	14718.353
107.152	11911.576
107.168	12625.877
110.459	11486.154
112.332	12821.272
114.957	14776.153];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'female'};  
bibkey.LW_f = 'YigiIsme2012'; 
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
39.554	464.183
42.963	464.183
46.372	464.183
48.761	567.335
51.836	928.367
52.867	1392.550
54.222	928.367
56.614	1237.822
56.615	1289.398
59.347	1495.702
62.755	1444.126
62.763	1908.309
64.497	3455.587
65.147	1753.582
70.264	1959.885
71.656	3455.587
75.070	3713.467
75.403	3300.860
76.768	3352.436
77.158	5931.232
79.845	3816.619
79.852	4177.650
82.229	3713.467
110.086	16555.874];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'male'};  
bibkey.LW_m = 'YigiIsme2012'; 
comment.LW_m = 'Data for males';

% length-length
data.LL_f = [ ...
37.425	21.236
37.665	20.787
44.684	25.506
46.621	26.854
49.034	25.955
49.767	28.876
51.455	27.753
51.705	30.674
51.713	33.371
53.392	29.551
54.369	32.921
56.298	32.022
57.502	30.674
58.242	35.618
59.444	33.820
63.073	35.843
67.433	39.663
72.021	39.438
72.276	43.708
72.996	42.135
77.348	43.708
79.768	45.056
81.449	41.910
83.890	50.225
85.096	49.775
87.275	51.348
89.200	48.876
92.150	66.180
92.358	54.944
93.319	53.146
93.572	56.966
94.290	54.944
97.680	57.640
98.184	64.382
98.663	63.034
101.789	58.539
103.502	65.955
107.117	63.034
107.121	64.382
109.352	83.258
109.783	66.180
112.439	65.730
114.146	71.124];
units.LL_f = {'cm', 'cm'};  label.LL_f = {'total length', 'disc width', 'female'};  
bibkey.LL_f = 'YigiIsme2012'; 
comment.LL_f = 'Data for females';
%
data.LL_m = [ ...
39.750	24.912
42.210	24.516
45.206	26.364
46.080	25.176
48.200	27.815
52.961	31.114
53.305	29.135
53.317	32.434
54.008	29.135
54.171	25.968
54.371	32.170
56.130	32.302
57.185	32.302
57.194	34.545
59.656	34.809
62.825	35.865
63.353	35.865
64.102	47.742
64.790	43.783
64.931	34.677
65.650	38.768
70.578	39.956
71.817	42.067
74.112	44.443
74.804	41.672
76.221	44.311
77.475	50.381
80.086	43.651
80.097	46.422
83.092	47.874];
units.LL_m = {'cm', 'cm'};  label.LL_m = {'total length', 'disc width', 'male'};  
bibkey.LL_m = 'YigiIsme2012'; 
comment.LL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
%weights.ab = 0 * weights.ab;
weights.LL_m([18 27],:) = 0; % ignore outliers
weights.LL_f([28 40],:) = 0; % ignore outliers
weights.tL_f = 20 * weights.tL_f;
weights.tL_m = 20 * weights.tL_m;
weights.Li_DWf = 0 * weights.Li_DWf;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 10 * weights.psd.v;
data.psd.k = 0.3; weights.psd.k = 1;
units.psd.k = '-'; label.psd.k = 'maintenance rate coef.';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
set2 = {'LW_f','LW_m'}; subtitle2 = 'Data for females, males';
set3 = {'LL_f','LL_m'}; subtitle3 = 'Data for females, males';
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
D3 = 'expected age at birth of 707 d seems very long; relative growth is still fast at 16 yr, while life span is 21 yr; absolute growth is very slow. This questions aging method';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'mother feeds neonates with uterine milk';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '347D2'; % Cat of Life
metaData.links.id_ITIS = '160959'; % ITIS
metaData.links.id_EoL = '46560871'; % Ency of Life
metaData.links.id_Wiki = 'Dasyatis_pastinaca'; % Wikipedia
metaData.links.id_ADW = 'Dasyatis_pastinaca'; % ADW
metaData.links.id_Taxo = '42133'; % Taxonomicon
metaData.links.id_WoRMS = '105851'; % WoRMS
metaData.links.id_fishbase = 'Dasyatis-pastinaca'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasyatis_pastinaca}}'; 
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
bibkey = 'YigiIsme2012'; type = 'Article'; bib = [ ...  
'author = {C. C. Yigin and A. Ismen}, ' ...
'year = {2012}, ' ...
'title  = {Age, growth and reproduction of the common stingray, \emph{Dasyatis pastinaca} from the {North Aegean Sea}}, ' ...
'journal = {Marine Biology Research}, ' ...
'doi = {10.1080/17451000.2012.659667}, ' ...
'volume = {8}, ' ...
'pages = {644--653}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dasyatis_pastinaca}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/25629}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

