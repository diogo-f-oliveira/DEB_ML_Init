function [data, auxData, metaData, txtData, weights] = mydata_Triaenodon_obesus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Triaenodon_obesus'; 
metaData.species_en = 'Whitetip reef shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data

data.ab = 10*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'Robb2006';   
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '10-12 mnth';
data.am = 19*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'Robb2006';   
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 60;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Robb2006';  
data.Lp  = 118;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Robb2006'; 
  comment.Lp = '114-122 cm';
data.Lpm  = 114;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Robb2006'; 
  comment.Lpm = '112-116 cm';
data.Li  = 213;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Ri  = 3/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Robb2006';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 pups per litter, 1 litter each 2 yrs';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.956	84.440
1.999	100.067
2.000	87.642
2.967	95.622
2.992	102.313
3.986	100.736
3.986	97.550
3.987	95.002
5.003	114.770
5.029	108.399
5.030	105.531
5.081	103.302
6.989	120.855
6.990	116.395
6.990	112.890
7.043	99.192
7.067	109.705
7.983	119.278
7.983	116.729
8.009	115.136
8.010	111.951
8.059	124.695
8.975	131.081
8.975	128.214
9.001	126.303
9.079	115.791
9.967	146.389
9.995	127.274
9.997	113.575
10.021	124.089
10.045	133.647
10.047	119.310
10.988	127.609
11.013	130.795
11.037	145.132
11.038	139.716
11.038	137.167
11.038	134.300
12.006	139.731
12.006	135.589
12.974	139.746
12.974	136.879
13.024	142.933
15.012	138.823
16.003	156.680
16.004	149.671
19.011	148.126];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','female'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Robb2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.008	79.662
1.974	92.421
1.975	89.872
1.975	85.731
2.967	100.083
2.967	97.853
2.968	90.525
2.969	86.702
3.985	104.559
3.986	98.506
4.012	92.772
5.004	103.620
5.005	98.841
5.029	109.036
5.030	106.169
5.972	109.051
5.972	107.139
5.996	114.786
5.997	111.919
6.022	117.972
7.016	113.846
7.018	100.784
7.983	120.552
8.060	112.907
8.978	113.240
9.002	121.843
9.002	120.250
9.969	131.097
9.970	121.858
9.995	128.549
10.022	114.850
10.963	129.520
10.987	137.803
11.015	121.875
11.957	123.483
13.026	130.827
13.969	131.798
16.058	130.875];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','male'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Robb2006';
comment.tL_m = 'Data for males';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
84.289	2671.310
87.778	2443.763
93.463	3964.692
93.979	4233.528
95.659	3828.070
96.693	3602.727
99.535	4452.956
100.827	5439.231
100.827	4451.797
101.731	5079.353
103.023	4988.425
103.023	5302.608
103.540	4224.946
104.315	5166.799
105.478	6198.070
106.124	4581.692
106.770	5748.079
107.674	6734.699
107.674	6420.516
109.483	6508.658
109.483	6194.475
110.388	7225.980
110.775	7001.215
111.421	7494.352
111.809	7000.287
111.938	8481.320
112.455	6730.407
114.264	6728.784
114.780	8254.352
115.039	6324.139
116.072	9285.509
116.202	8567.259
116.848	7983.198
117.235	8566.331
118.656	7487.857
119.302	8923.543
119.690	8609.013
120.207	10403.881
120.336	8204.482
123.824	9413.199
123.824	10221.099
125.504	9411.692
126.408	10981.797
127.442	9903.669
127.442	10621.803
130.026	10350.183
130.413	11606.567
130.413	11247.501
130.543	9317.402
132.610	15105.493
134.031	12007.269
134.806	13353.072
136.357	15506.079
137.132	15011.666
137.649	12946.571
138.811	15010.159
139.457	19049.077
139.457	13034.714
142.041	15590.742
144.496	17563.405
144.884	12625.893
146.951	16214.702
149.147	19668.744];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f  = 'Robb2006';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
78.605	1778.747
85.711	2849.568
86.486	2938.638
89.070	3250.502
89.716	2845.973
89.974	3339.458
91.008	2755.047
91.395	3652.365
91.783	3113.417
93.204	4009.807
96.951	4230.861
97.597	3826.330
98.501	5082.252
99.147	3824.938
99.406	4363.306
99.793	4856.675
100.568	4092.963
100.698	4586.564
103.152	5078.077
104.186	5391.332
104.574	5076.801
105.478	5569.704
106.512	6152.260
108.320	5252.970
108.450	5746.571
108.579	6554.355
108.837	5432.040
109.225	6015.175
112.326	5339.142
112.713	6775.059
112.972	6550.411
113.618	6056.115
114.134	7985.634
114.134	7043.083
114.651	6459.136
118.010	8834.935
119.302	7262.861
119.690	8249.945
120.336	8339.133
121.111	7575.420
121.499	8742.038
121.499	8113.672
122.274	8427.159
122.791	10940.161
128.346	11698.189
129.251	10171.345
129.897	9048.682
130.284	9990.883
130.543	10798.551
130.930	12414.002
136.744	11870.184];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m  = 'Robb2006';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5855Q'; % Cat of Life
metaData.links.id_ITIS = '160453'; % ITIS
metaData.links.id_EoL = '46559826'; % Ency of Life
metaData.links.id_Wiki = 'Triaenodon_obesus'; % Wikipedia
metaData.links.id_ADW = 'Triaenodon_obesus'; % ADW
metaData.links.id_Taxo = '42001'; % Taxonomicon
metaData.links.id_WoRMS = '214557'; % WoRMS
metaData.links.id_fishbase = 'Triaenodono-besus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triaenodon_obesus}}';
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
bibkey = 'Robb2006'; type = 'phdthesis'; bib = [ ... 
'author = {William David Robbins}, ' ... 
'year = {2006}, ' ...
'title = {Abundance, demography and population structure of the grey reef shark (\emph{Carcharhinus amblyrhynchos}) and the whitetip reef shark(\emph{Triaenodon obesus}) (fam. {C}archarhiniidae)}, ' ...
'school = {School of Marine Biology and Auqaculture, James Cook University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Triaenodon-obesus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

