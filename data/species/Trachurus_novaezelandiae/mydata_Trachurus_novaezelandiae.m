function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_novaezelandiae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_novaezelandiae'; 
metaData.species_en = 'Yellowtail horse mackerel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.3); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 20];

%% set data
% zero-variate data

data.ab = 10;   units.ab = 'd';    label.ab = 'time at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'fishbase';   
  temp.am = C2K(15.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 138;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^2.99, see F1';
data.Wwi = 2137; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^2.99, see F1';

data.Ri  = 302358/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Trachurus_picturatus';
 
% uni-variate data
% time-length
data.tL_N =	[ % time since birth (yr), total length (cm)
1.544	21.114
1.560	18.331
1.564	19.912
2.560	24.588
2.572	20.034
2.591	18.706
2.597	21.805
2.598	22.437
2.599	22.817
2.611	18.137
2.639	21.362
2.643	23.386
2.645	24.271
2.660	20.730
2.675	17.884
2.679	19.528
2.680	20.160
2.715	26.990
2.725	21.109
2.727	22.184
2.729	23.133
2.733	25.093
2.749	22.374
2.754	24.840
2.755	25.725
2.759	27.433
2.762	29.140
2.772	23.385
2.778	26.421
2.783	18.073
2.785	19.085
2.786	19.464
2.796	24.587
2.823	27.053
3.500	22.434
3.544	22.939
3.545	23.509
3.550	25.912
3.570	25.026
3.583	21.168
3.600	18.955
3.601	19.524
3.602	19.904
3.604	20.662
3.605	21.421
3.606	21.991
3.632	24.014
3.695	23.445
3.716	22.939
3.718	24.140
3.720	25.152
3.728	29.200
3.730	19.524
3.740	24.583
3.745	26.670
3.746	16.741
3.751	19.081
3.753	20.219
3.760	23.887
3.765	26.227
3.767	27.302
3.769	28.061
3.770	28.820
3.771	18.638
3.775	20.535
3.807	25.531
4.550	21.797
4.553	22.998
4.575	23.378
4.576	24.200
4.577	24.706
4.580	26.034
4.678	21.290
4.725	23.187
4.735	28.183
4.748	23.946
4.772	25.337
4.774	26.160
4.776	27.235
4.777	27.804
4.778	28.563
4.813	24.578
5.036	28.688
5.564	24.322
5.584	23.690
5.604	23.120
5.644	21.476
5.722	28.432
5.756	23.752
5.780	25.270
5.781	25.586
5.782	26.155
6.005	30.139
6.045	28.874
6.046	29.569
6.592	23.559
6.597	25.772
6.598	26.342
6.617	25.266
6.621	26.974
6.637	24.507
6.658	24.254
6.726	25.898
6.749	26.531
6.767	25.076
6.769	26.278
6.771	27.163
6.772	27.732
6.773	28.048
6.774	28.554
6.775	28.870
6.776	29.187
6.786	23.685
6.788	24.696
6.795	28.364
6.808	24.001
7.035	30.134
7.537	23.618
7.561	24.820
7.562	25.326
7.581	24.314
7.588	27.855
7.606	26.274
7.709	24.060
7.738	27.538
7.779	26.653
7.785	29.878
7.799	26.084
7.819	25.514
7.825	28.297
8.023	30.762
8.574	27.155
8.597	28.167
8.721	25.763
8.741	25.004
8.742	25.321
8.744	26.649
8.748	28.483
8.749	28.989
8.754	31.202
8.943	29.367
8.987	29.873
9.782	30.376
9.792	24.747
9.819	27.340
10.019	30.754
10.036	28.477
10.613	27.336
10.791	30.498
11.776	29.608
13.922	29.726];
data.tL_N(:,1) = 365 * (0.5+data.tL_N(:,1)); % convert yr to d
units.tL_N   = {'d', 'cm'};  label.tL_N = {'time since birth', 'total length', 'northern region'};  
temp.tL_N    = C2K(15.3);  units.temp.tL_N = 'K'; label.temp.tL_N = 'temperature';
bibkey.tL_N = 'StewFerr2001';
%
data.tL_S =	[ % time since birth (yr), total length (cm)
1.414	20.419
1.945	17.760
1.947	18.456
1.954	21.808
1.955	22.314
1.971	19.658
1.975	21.555
1.986	16.369
1.987	16.938
2.006	15.610
2.011	18.519
2.015	20.226
2.027	15.800
2.363	22.755
2.366	23.956
2.384	22.249
2.386	23.513
2.389	24.715
2.400	19.529
2.403	21.363
2.416	17.063
2.417	17.442
2.418	17.695
2.422	20.035
2.466	20.414
2.488	20.730
2.490	21.742
2.950	15.922
2.955	18.199
2.959	19.970
2.960	20.855
2.978	19.084
2.979	19.590
2.983	21.298
2.984	21.867
2.985	22.183
2.986	22.815
2.988	24.080
2.994	16.491
2.996	17.250
2.997	17.629
3.017	17.060
3.020	18.641
3.025	20.981
3.035	15.479
3.045	20.096
3.046	20.538
3.069	21.424
3.417	24.015
3.418	24.331
3.420	25.217
3.432	20.473
3.960	16.614
3.963	17.878
3.995	22.938
4.015	22.558
4.093	18.700
4.977	20.593
5.189	19.391
5.416	25.524
5.435	24.386
5.456	23.943
5.460	26.283
5.479	24.702
6.008	20.905
6.157	20.336
6.200	20.778
6.201	21.031
6.356	23.497
6.382	25.520
6.385	27.228
6.445	24.824
7.167	21.153
7.208	20.458
7.497	25.010
8.153	20.643
8.201	22.983
8.217	20.264
8.398	25.132
9.384	24.306];
data.tL_S(:,1) = 365 * (0.5+data.tL_S(:,1)); % convert yr to d
units.tL_S   = {'d', 'cm'};  label.tL_S = {'time since birth', 'total length', 'northern region'};  
temp.tL_S    = C2K(15.3);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'StewFerr2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_N = 5 * weights.tL_N;
weights.tL_S = 5 * weights.tL_S;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.comment = comment;
txtData.bibkey = bibkey;

%% Group plots
set1 = {'tL_N','tL_S'}; subtitle1 = {'Data from northern, southern region'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01778*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PKW'; % Cat of Life
metaData.links.id_ITIS = '168593'; % ITIS
metaData.links.id_EoL = '46578053'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_novaezelandiae'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_novaezelandiae'; % ADW
metaData.links.id_Taxo = '189256'; % Taxonomicon
metaData.links.id_WoRMS = '126821'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-novaezelandiae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_novaezelandiae}}';
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
bibkey = 'StewFerr2001'; type = 'article'; bib = [ ...
'doi = {10.1080/00288330.2001.9517021}, ' ...
'author = {John Stewart and Douglas J. Ferrell}, ' ... 
'year = {2001}, ' ...
'title = {Age, growth, and commercial landings of yellowtail scad (\emph{Trachurus novaezelandiae}) and blue mackerel (\emph{Scomber australasicus}) off the coast of {N}ew {S}outh {W}ales, {A}ustralia}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {35(3)}, ' ...
'pages = {541-551}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trachurus-novaezelandiae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

