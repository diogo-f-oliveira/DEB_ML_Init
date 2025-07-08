function [data, auxData, metaData, txtData, weights] = mydata_Hyporhamphus_australis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hyporhamphus_australis'; 
metaData.species_en = 'Eastern sea garfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'StewHugh2007';   
  temp.am = C2K(20.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'StewHugh2007'; 
  comment.Lp = 'based on tL data at ap = 1 yr';
data.Li  = 39;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';
  comment.Li = 'based on TL 39.8 cm, converted to FL by FL = 0.98*TL from photo';

data.Wwb = 4.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 25.9;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fisfbase';
  comment.Wwi = 'based on 0.00240*Li^3.10, see F1';

data.Ri = 1.3e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(20.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95, reflecting reported low fecundity';
 
% uni-variate data
% time-length
data.tL_f = [... % time since birth (d), fork length (cm)
65.755	6.189
68.284	7.528
75.871	12.464
80.929	5.770
154.270	12.795
169.444	17.397
174.502	14.551
177.031	19.321
179.560	18.233
179.560	19.070
187.148	15.052
192.206	19.822
192.206	20.575
192.206	23.923
194.735	21.412
194.735	21.830
197.264	22.583
220.025	23.670
222.554	22.666
222.554	21.327
222.554	19.151
225.083	23.670
225.083	22.247
225.083	21.912
225.083	20.908
230.141	24.841
232.670	21.577
232.670	20.155
237.728	21.326
237.728	20.573
237.728	20.238
240.257	19.234
263.018	20.153
265.547	24.839
265.547	19.483
270.605	21.910
270.605	22.245
275.663	23.248
280.721	21.491
285.779	20.570
288.308	22.160
288.308	21.574
290.837	20.737
293.366	22.913
293.366	23.666
293.366	25.256
333.831	22.743
351.534	23.914
354.063	23.077
434.992	27.256
442.579	29.264
452.695	29.682
452.695	21.732
457.753	28.259
457.753	24.410
460.282	26.669
465.340	30.100
465.340	24.577
465.340	19.054
467.869	27.255
475.456	29.095
475.456	29.848
480.514	25.580
480.514	25.078
480.514	22.903
480.514	22.149
483.043	24.492
483.043	23.572
483.043	21.982
483.043	21.229
483.043	20.727
483.043	19.890
485.572	26.668
488.101	27.839
493.159	19.889
495.688	27.253
498.217	28.759
505.804	29.847
505.804	28.591
505.804	24.156
508.333	23.152
508.333	24.826
508.333	25.244
510.862	25.913
513.391	27.168
515.920	29.260
515.920	27.921
515.920	27.252
515.920	25.578
518.449	28.758
520.978	28.172
526.036	30.599
526.036	26.331
533.624	26.163
536.153	22.230
543.740	27.334
543.740	29.259
543.740	27.920
546.269	28.840
546.269	23.234
548.798	31.267
548.798	30.598
548.798	25.744
551.327	26.162
556.385	31.099
556.385	26.413
556.385	29.007
558.914	28.086
561.443	29.676
561.443	24.488
563.972	23.484
566.501	27.249
569.030	28.086
571.559	29.508
591.791	30.428
604.436	29.256
612.023	23.899
612.023	28.837
617.081	24.318
617.081	29.924
619.610	30.677
619.610	32.602
619.610	29.255
622.139	29.171
622.139	27.832
627.197	30.844
632.255	29.589
634.784	28.668
639.842	24.149
642.371	29.421
644.900	30.341
647.429	31.680
647.429	31.178
660.075	22.725
667.662	29.670
667.662	30.507
667.662	31.595
667.662	28.248
698.010	28.497
700.539	29.418
718.242	29.500
804.229	31.253
809.287	32.006
832.048	31.921
834.577	28.657
837.106	29.243
839.635	32.339
892.745	31.918
892.745	26.060
910.448	32.335
915.506	32.920
915.506	27.732
918.035	28.234
920.564	27.816
923.093	33.590
925.622	31.581
925.622	30.493
930.680	32.334
930.680	33.338
940.796	28.568
973.673	33.587
991.376	30.908
993.905	30.322
998.963	29.903
1001.493	31.409
1041.957	31.742
1186.111	32.906
1299.917	36.247
1299.917	34.740
1616.045	33.384];
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(20.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewHugh2007';
comment.tL_f = 'data for females';
%
data.tL_m = [... % time since birth (d), fork length (cm)
103.690	17.149
108.748	17.902
116.335	16.814
225.083	16.891
225.083	17.226
237.728	18.230
240.257	19.401
242.786	25.259
257.960	25.258
260.489	20.237
263.018	24.170
268.076	23.249
273.134	19.399
293.366	20.904
293.366	21.323
333.831	24.417
333.831	20.316
336.360	26.341
338.889	21.237
343.947	22.324
349.005	20.901
354.063	20.566
354.063	19.478
437.521	23.072
440.050	22.654
440.050	23.993
442.579	23.239
447.637	24.662
455.224	19.055
457.753	17.632
457.753	18.803
457.753	20.310
457.753	21.649
460.282	23.071
470.398	23.740
470.398	23.740
475.456	24.827
477.985	18.886
477.985	20.141
505.804	24.575
505.804	25.579
508.333	24.156
515.920	22.817
515.920	21.980
515.920	25.997
518.449	23.570
523.507	23.068
526.036	25.243
531.095	24.573
543.740	25.493
546.269	24.991
546.269	24.573
546.269	23.903
563.972	20.890
571.559	25.575
591.791	26.746
596.849	25.407
596.849	25.825
599.378	26.411
601.907	27.749
609.494	25.406
617.081	25.908
617.081	28.167
627.197	23.145
629.726	26.158
629.726	25.656
629.726	26.576
634.784	27.580
634.784	28.082
644.900	26.241
667.662	26.909
672.720	27.243
682.836	27.243
708.126	26.739
708.126	26.237
708.126	28.162
725.829	26.571
725.829	27.157
816.874	27.236
832.048	25.896
839.635	20.038
844.693	28.238
852.280	23.217
854.809	19.367
859.867	26.982
887.687	24.554
892.745	27.901
905.390	29.657
920.564	26.644
923.093	24.970
935.738	25.555
935.738	24.886
935.738	24.049
940.796	26.978
971.144	29.905
988.847	27.142
1036.899	27.391];
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(20.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewHugh2007';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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

%% Facts
F1 = 'wet weight (g) = 0.00240*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYDR'; % Cat of Life
metaData.links.id_ITIS = '165484'; % ITIS
metaData.links.id_EoL = '46567009'; % Ency of Life
metaData.links.id_Wiki = 'Hyporhamphus_australis'; % Wikipedia
metaData.links.id_ADW = 'Hyporhamphus_australis'; % ADW
metaData.links.id_Taxo = '177171'; % Taxonomicon
metaData.links.id_WoRMS = '272179'; % WoRMS
metaData.links.id_fishbase = 'Hyporhamphus-australis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus}}'];
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
bibkey = 'StewHugh2007'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2006.01256.x}, ' ...
'author = {J. Stewart and J. M. Hughes}, ' ... 
'year = {2007}, ' ...
'title = {Age validation and growth of three commercially important hemiramphids in south-eastern {A}ustralia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {70}, ' ...
'pages = {65-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hyporhamphus-australis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

