function [data, auxData, metaData, txtData, weights] = mydata_Sphyrna_tiburo

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Sphyrnidae';
metaData.species    = 'Sphyrna_tiburo'; 
metaData.species_en = 'Bonnethead shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW','MPE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O','Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 21];


%% set data
% zero-variate data;
data.ab = 4.75*30.5;     units.ab = 'd';      label.ab = 'age at birth';              bibkey.ab = 'Wiki';    
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4.5 - 5 mnth';
data.am = 12*365;  units.am = 'd';      label.am = 'life span';                     bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 31.5;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';        bibkey.Lb  = 'Wiki';
  comment.Lb = '30-33 cm';
data.Lp  = 81;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty (female)'; bibkey.Lp  = 'Wiki';
data.Lpm  = 61;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty (male)';   bibkey.Lpm  = 'Wiki';
data.Li  = 150;  units.Li  = 'cm';  label.Li  = 'ultimate total length (female)';      bibkey.Li  = 'fishbase';

data.Wwi = 11.14e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00200*Li^3.10, see F2';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'Wiki'; 
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-9 pups per litter, 1 litter per yr assumed';

% uni-variate data
% time - length
data.tL_Tf = [ ... % time since birth (yr), total length (cm)
0.000	33.004
0.000	35.157
0.000	39.658
0.503	60.807
0.533	63.939
0.536	54.350
0.564	65.701
1.564	92.539
1.568	81.385
1.568	80.406
1.571	71.405
1.584	79.820
1.586	73.362
1.600	78.646
1.602	70.427
1.603	69.057
1.603	67.883
1.603	67.100
1.604	65.730
1.604	64.165
1.605	62.404
1.617	74.341
1.632	76.103
1.676	83.932
2.618	99.614
2.624	78.675
2.635	94.331
2.639	81.219
2.651	92.961
2.654	84.351
2.668	88.265
2.669	83.373
2.670	82.199
2.679	103.334
2.679	101.964
3.705	97.296
3.705	96.317
3.718	104.146
3.719	101.797
3.735	101.015
3.735	100.428
3.735	99.254
3.740	85.360
3.740	83.598
4.759	103.001
4.759	101.044
4.760	99.282
4.760	98.304
4.776	96.347
4.787	110.633
4.788	108.285
4.789	105.350
4.789	104.176
4.792	95.174
4.793	93.608
4.793	91.064
4.804	107.111
5.843	108.902
5.844	107.532
5.844	105.966
5.845	104.596
5.856	116.338
5.892	101.271
5.893	99.705
5.909	97.945
6.913	111.280
6.915	105.605
6.930	106.779];
data.tL_Tf(:,1) = 365 * (.5 + data.tL_Tf(:,1)); % convert yr to d
data.tL_Tf(:,2) = data.tL_Tf(:,2)/0.786; % convert FL to TL
units.tL_Tf = {'d', 'cm'};     label.tL_Tf = {'time since birth', 'total length', 'female'};  
  temp.tL_Tf = C2K(25); units.temp.tL_Tf = 'K'; label.temp.tL_Tf = 'temperature';
bibkey.tL_Tf = 'Pars1993';
comment.tL_Tf = 'Data for females, Tampa Bay';
%
data.tL_Tm = [ ... % time since birth (yr), total length (cm)
0.000	34.029
0.000	35.755
0.000	36.853
0.551	47.348
0.582	62.877
0.582	64.445
0.592	58.955
1.636	65.359
1.638	69.437
1.638	70.536
1.639	71.790
1.639	72.732
1.664	75.711
1.665	77.907
2.742	51.056
2.745	84.938
2.746	85.565
2.746	86.193
2.746	86.977
2.747	87.448
2.751	70.506
2.752	72.702
2.752	73.957
2.753	74.742
2.755	79.761
2.755	80.546
2.756	81.487
2.757	83.840
2.759	88.232
2.760	91.055
2.777	77.251
2.778	77.721
2.794	60.623
3.823	87.576
3.826	92.753
3.826	93.380
3.835	86.792
3.846	84.595
3.846	85.850
3.855	78.478
4.913	88.175
4.931	77.195
4.932	79.234
4.933	80.489
4.959	87.233
6.021	79.990];
data.tL_Tm(:,1) = 365 * (.5 + data.tL_Tm(:,1)); % convert yr to d
units.tL_Tm = {'d', 'cm'};     label.tL_Tm = {'time since birth', 'total length', 'male'};
  temp.tL_Tm = C2K(25); units.temp.tL_Tm = 'K'; label.temp.tL_Tm = 'temperature';
bibkey.tL_Tm = 'Pars1993';
comment.tL_Tm = 'Data for males, Tampa Bay';

%
data.tL_Ff = [ ... % time since birth (yr), total length (cm)
0.058	35.116
0.059	28.140
0.089	32.558
1.626	57.209
1.638	82.093
1.639	78.372
2.665	83.721
2.666	70.465
2.667	68.605
2.680	85.581
2.680	84.186
2.714	66.279
3.766	104.186
3.786	74.651
3.799	92.093
3.799	90.930
3.815	89.070
4.826	89.302
4.826	87.442
4.827	86.744
4.840	99.302
4.841	95.814
4.841	91.163
4.856	100.465
4.858	85.116
4.872	93.953
4.872	92.558
5.898	98.140
5.899	96.977
5.899	94.419
5.899	93.256
5.915	86.512
5.930	91.860
6.972	95.814
6.987	98.837
7.003	93.721];
data.tL_Ff(:,1) = 365 * (.5 + data.tL_Ff(:,1)); % convert yr to d
units.tL_Ff = {'d', 'cm'};     label.tL_Ff = {'time since birth', 'total length', 'female'};  
  temp.tL_Ff = C2K(25); units.temp.tL_Ff = 'K'; label.temp.tL_Ff = 'temperature';
bibkey.tL_Ff = 'Pars1993';
comment.tL_Ff = 'Data for females, Florida Bay';
%
data.tL_Fm = [ ... % time since birth (yr), total length (cm)
0.000	32.212
0.000	32.992
0.000	28.315
0.524	53.437
0.527	43.769
0.555	50.631
0.566	49.228
1.624	55.187
1.635	54.252
1.651	63.297
1.666	52.381
1.673	58.619
2.748	75.495
2.748	74.247
2.757	79.082
2.759	73.156
2.766	81.733
2.777	77.367
2.779	71.909
2.780	71.441
2.780	70.194
2.781	69.102
3.861	71.007
3.861	70.384
3.867	79.740
3.870	72.879
3.870	72.255
3.878	78.961
3.879	75.218
3.880	74.439
3.880	73.815
3.899	77.558
3.899	76.467
3.899	75.843
5.002	70.887
5.004	64.493
5.010	77.437
5.010	75.722
5.011	73.850
5.017	84.611];
data.tL_Fm(:,1) = 365 * (.5 + data.tL_Fm(:,1)); % convert yr to d
units.tL_Fm = {'d', 'cm'};     label.tL_Fm = {'time since birth', 'total length', 'male'};
  temp.tL_Fm = C2K(25); units.temp.tL_Fm = 'K'; label.temp.tL_Fm = 'temperature';
bibkey.tL_Fm = 'Pars1993';
comment.tL_Fm = 'Data for males, Florida Bay';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Tf = 3 * weights.tL_Tf;
weights.tL_Tm = 3 * weights.tL_Tm;
weights.tL_Ff = 3 * weights.tL_Ff;
weights.tL_Fm = 3 * weights.tL_Fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Tf','tL_Tm'}; subtitle1 = {'Data for females, males from Tampa Bay'};
set2 = {'tL_Ff','tL_Fm'}; subtitle2 = {'Data for females, males from Florida Bay'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'viviparous; facultative pathenogenetic';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g  = 0.00200 * (TL in cm)^3.10';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4Z2QP'; % Cat of Life
metaData.links.id_ITIS = '160502'; % ITIS
metaData.links.id_EoL = '46559951'; % Ency of Life
metaData.links.id_Wiki = 'Sphyrna_tiburo'; % Wikipedia
metaData.links.id_ADW = 'Sphyrna_tiburo'; % ADW
metaData.links.id_Taxo = '106469'; % Taxonomicon
metaData.links.id_WoRMS = '158517'; % WoRMS
metaData.links.id_fishbase = 'Sphyrna-tiburo'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyrna_tiburo}}';  
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
bibkey = 'Pars1993'; type = 'Article'; bib = [ ...  
'author = {G. R. Parsons}, ' ...
'year = {1993}, ' ...
'title  = {Age determination and growth of the bonnethead shark \emph{Sphyrna tiburo}: a comparison of two populations}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {117}, ' ...
'pages = {23-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sphyrna-tiburo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  