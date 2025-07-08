function [data, auxData, metaData, txtData, weights] = mydata_Mytilopsis_sallei 
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Dreissenidae';
metaData.species    = 'Mytilopsis_sallei';
metaData.species_en = 'Black-striped mussel'; 

metaData.ecoCode.climate = {'A', 'B'};
metaData.ecoCode.ecozone = {'TN', 'TPi', 'TA', 'TH'};
metaData.ecoCode.habitat = {'0iFe'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'piPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-JX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Alicia Lee Sian Tan', 'Antonio Giacoletti', 'Gianluca Sara', 'Gray Williams'};       
metaData.date_subm = [2017 07 20];                  
metaData.email    = {'anto.giacoletti@gmail.com'};              
metaData.address  = {'Department of Earth and Marine Sciences, University of Palermo, Italy'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 07 20]; 

%% set data
% zero-variate data;
data.ab = 0.25;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'HeFei2016';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = 'Trochophore stage'; 
data.aj = 9;      units.aj = 'd';    label.aj = 'age at metamorphosis';  bibkey.aj = 'HeFei2016';   
  temp.aj = C2K(27);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj  = 'Plantigrade stage'; 
data.ap = 30;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Mort1989';
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
 data.am = 18/12*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Mort1989';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.007;  units.Lb  = 'cm';   label.Lb  = 'total length at birth';           bibkey.Lb  = 'HeFei2016';  
data.Lj  = 0.03;   units.Lj  = 'cm';   label.Lj  = 'total length at metamorphosis';   bibkey.Lj  = 'HeFei2016';
data.Lp  = 1.0;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';         bibkey.Lp  = 'Mort1989'; 
data.Li  = 3.16;   units.Li  = 'cm';   label.Li  = 'ultimate total length';           bibkey.Li  = 'Lee2015';

data.Wwb = 1.131e-7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'HeFei2016';
  comment.Wwb = 'computed from egg diameter of 0.006 cm: 4/3*pi*(0.006/2)^3';
data.Wwp = 0.011;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'Lee2015';
data.Wwi = 0.3194; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Lee2015';

data.Ri  = 23000/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Lee2015';   
temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

%  tL-data from birth to settlement at 27 C 
data.tL = [... % time since birth (d), total length (cm)
0.25  0.007     % Trochophore
0.69  0.009     % D-shaped larva
2.5   0.011     % Umbonate larva
7.0	  0.023     % Pediveliger
9.0   0.030     % Plantigrade
20.0  0.066];   % Juvenile
units.tL = {'d', 'cm'};  label.tL = {'age', 'larval length'};
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeFei2016';
comment.tL = 'Data from birth to settlement';

% Length-Wet weight relationship  from Hong Kong site
data.LW = [ ... % length(cm), wet weight (g))
    0.290 	0.310 	0.330 	0.350 	0.390 	0.400 	0.400 	0.400 	0.410 	0.410 	0.410 	0.420 	0.420 	0.450 	0.460 	0.460 	0.470 	0.490 	0.500 	0.500 	0.520 	0.520 	0.520 	0.520 	0.520 	0.520 	0.520 	0.530 	0.530 	0.530 	0.530 	0.530 	0.550 	0.560 	0.560 	0.560 	0.570 	0.580 	0.580 	0.580 	0.590 	0.600 	0.610 	0.620 	0.620 	0.620 	0.630 	0.630 	0.650 	0.650 	0.650 	0.670 	0.680 	0.680 	0.680 	0.680 	0.690 	0.690 	0.720 	0.720 	0.720 	0.730 	0.730 	0.740 	0.740 	0.740 	0.740 	0.750 	0.760 	0.770 	0.780 	0.790 	0.800 	0.800 	0.800 	0.800 	0.810 	0.830 	0.830 	0.840 	0.840 	0.860 	0.860 	0.870 	0.870 	0.870 	0.870 	0.870 	0.880 	0.880 	0.880 	0.890 	0.900 	0.900 	0.900 	0.910 	0.920 	0.920 	0.930 	0.930 	0.940 	0.940 	0.940 	0.940 	0.950 	0.950 	0.960 	0.970 	0.980 	0.980 	0.980 	0.990 	0.990 	0.990 	0.990 	1.000 	1.000 	1.000 	1.010 	1.010 	1.010 	1.020 	1.020 	1.020 	1.040 	1.050 	1.050 	1.050 	1.050 	1.050 	1.060 	1.060 	1.070 	1.080 	1.080 	1.080 	1.090 	1.090 	1.090 	1.090 	1.100 	1.100 	1.100 	1.100 	1.100 	1.100 	1.110 	1.110 	1.110 	1.110 	1.120 	1.130 	1.140 	1.140 	1.150 	1.150 	1.150 	1.150 	1.150 	1.150 	1.160 	1.160 	1.160 	1.160 	1.170 	1.170 	1.180 	1.180 	1.180 	1.180 	1.180 	1.180 	1.180 	1.190 	1.190 	1.190 	1.190 	1.190 	1.200 	1.200 	1.200 	1.210 	1.220 	1.220 	1.220 	1.230 	1.230 	1.230 	1.240 	1.240 	1.240 	1.250 	1.250 	1.260 	1.260 	1.260 	1.260 	1.270 	1.270 	1.270 	1.280 	1.290 	1.290 	1.300 	1.300 	1.300 	1.310 	1.310 	1.310 	1.320 	1.320 	1.320 	1.320 	1.320 	1.330 	1.330 	1.340 	1.340 	1.340 	1.340 	1.340 	1.350 	1.355 	1.360 	1.360 	1.360 	1.370 	1.370 	1.380 	1.380 	1.380 	1.390 	1.390 	1.390 	1.400 	1.400 	1.400 	1.410 	1.410 	1.410 	1.420 	1.420 	1.420 	1.420 	1.420 	1.430 	1.430 	1.430 	1.440 	1.440 	1.450 	1.450 	1.460 	1.460 	1.460 	1.470 	1.480 	1.480 	1.480 	1.490 	1.500 	1.500 	1.530 	1.530 	1.530 	1.540 	1.570 	1.570 	1.570 	1.570 	1.580 	1.580 	1.580 	1.590 	1.590 	1.600 	1.600 	1.610 	1.610 	1.620 	1.620 	1.620 	1.620 	1.620 	1.630 	1.630 	1.640 	1.640 	1.640 	1.640 	1.660 	1.680 	1.680 	1.680 	1.680 	1.690 	1.690 	1.690 	1.700 	1.700 	1.700 	1.710 	1.720 	1.720 	1.720 	1.730 	1.730 	1.730 	1.740 	1.750 	1.750 	1.760 	1.770 	1.770 	1.770 	1.770 	1.780 	1.780 	1.790 	1.790 	1.790 	1.790 	1.790 	1.790 	1.800 	1.800 	1.810 	1.820 	1.820 	1.830 	1.830 	1.830 	1.840 	1.840 	1.840 	1.850 	1.850 	1.860 	1.870 	1.870 	1.880 	1.880 	1.880 	1.880 	1.890 	1.890 	1.890 	1.900 	1.900 	1.910 	1.910 	1.920 	1.920 	1.920 	1.930 	1.930 	1.950 	1.960 	1.960 	1.960 	1.960 	1.970 	1.980 	1.980 	1.980 	1.990 	2.000 	2.000 	2.000 	2.010 	2.020 	2.030 	2.030 	2.030 	2.030 	2.040 	2.040 	2.050 	2.050 	2.050 	2.050 	2.050 	2.055 	2.060 	2.060 	2.070 	2.070 	2.080 	2.080 	2.080 	2.090 	2.090 	2.090 	2.090 	2.090 	2.100 	2.100 	2.100 	2.100 	2.100 	2.100 	2.110 	2.120 	2.120 	2.120 	2.130 	2.130 	2.150 	2.160 	2.160 	2.160 	2.170 	2.170 	2.180 	2.180 	2.180 	2.180 	2.190 	2.190 	2.190 	2.190 	2.190 	2.190 	2.200 	2.210 	2.210 	2.210 	2.210 	2.210 	2.230 	2.230 	2.250 	2.250 	2.250 	2.260 	2.270 	2.290 	2.300 	2.300 	2.320 	2.340 	2.350 	2.350 	2.360 	2.360 	2.360 	2.370 	2.380 	2.390 	2.390 	2.400 	2.400 	2.400 	2.400 	2.400 	2.410 	2.410 	2.410 	2.420 	2.425 	2.430 	2.440 	2.440 	2.450 	2.450 	2.460 	2.460 	2.460 	2.470 	2.490 	2.510 	2.510 	2.520 	2.530 	2.530 	2.530 	2.530 	2.540 	2.560 	2.580 	2.580 	2.590 	2.600 	2.600 	2.600 	2.600 	2.610 	2.630 	2.650 	2.650 	2.660 	2.670 	2.670 	2.680 	2.690 	2.690 	2.700 	2.700 	2.710 	2.720 	2.720 	2.720 	2.720 	2.720 	2.740 	2.750 	2.770 	2.785 	2.870 	2.870 	2.880 	2.880 	2.900 	2.960 	2.960 	2.970 	2.970 	2.980 	3.010 	3.030;      % cm, snout-to-vent length at f
           0.00057	0.00008	0.00042	0.00169	0.00098	0.00009	0.00037	0.00096	0.00055	0.00113	0.00115	0.00095	0.00131	0.00014	0.00062	0.00224	0.00074	0.00092	0.00034	0.00113	0.00013	0.00031	0.00071	0.00075	0.00080	0.00107	0.00165	0.00052	0.00093	0.00105	0.00126	0.00270	0.00158	0.00093	0.00096	0.00182	0.00122	0.00079	0.00088	0.00280	0.00130	0.00073	0.00440	0.00146	0.00167	0.00181	0.00186	0.00575	0.00202	0.00204	0.00835	0.00328	0.00105	0.00386	0.00737	0.00740	0.00043	0.00711	0.00178	0.00400	0.00606	0.00452	0.00845	0.00130	0.00418	0.00787	0.00800	0.00240	0.00528	0.00530	0.00278	0.00184	0.00251	0.00508	0.00814	0.01200	0.00790	0.00167	0.00841	0.00742	0.00949	0.00374	0.00574	0.00321	0.00701	0.01005	0.01022	0.01217	0.00378	0.00732	0.01210	0.00944	0.00730	0.00971	0.01059	0.01373	0.00561	0.01000	0.00712	0.01095	0.00397	0.00993	0.00995	0.01265	0.00948	0.01051	0.00770	0.00725	0.00487	0.00811	0.01036	0.00655	0.00681	0.00731	0.02038	0.00922	0.01052	0.01098	0.00852	0.01078	0.01195	0.00947	0.01308	0.01488	0.01980	0.00854	0.01569	0.01571	0.01645	0.02163	0.01007	0.01178	0.01139	0.01404	0.01499	0.02357	0.00392	0.01118	0.01156	0.01177	0.00780	0.00977	0.01552	0.01675	0.02165	0.02368	0.01073	0.01382	0.01611	0.01753	0.02165	0.02022	0.01104	0.02978	0.01143	0.01211	0.01297	0.01804	0.02442	0.03161	0.01585	0.01847	0.01889	0.02355	0.01715	0.01966	0.01066	0.01272	0.01444	0.01663	0.01753	0.01824	0.01998	0.01406	0.01655	0.01668	0.03479	0.04133	0.00959	0.01450	0.02863	0.02003	0.01454	0.01758	0.01940	0.01510	0.01527	0.02849	0.01662	0.03126	0.03149	0.01221	0.01576	0.01103	0.01827	0.02282	0.02862	0.02188	0.02938	0.04751	0.01054	0.01824	0.02522	0.02190	0.02234	0.02336	0.01827	0.02024	0.02074	0.01270	0.02498	0.02544	0.02783	0.03817	0.02697	0.03516	0.02450	0.02491	0.02571	0.03917	0.07604	0.01746	0.01800	0.02301	0.02960	0.06363	0.03281	0.03631	0.02487	0.02877	0.03776	0.01671	0.03096	0.03126	0.01832	0.02275	0.03353	0.01120	0.02235	0.03388	0.02958	0.03298	0.04728	0.05176	0.06284	0.03240	0.04414	0.04471	0.03132	0.04168	0.03622	0.03666	0.02448	0.03094	0.04441	0.03058	0.02540	0.03635	0.06085	0.04993	0.01823	0.03887	0.04892	0.07017	0.07262	0.04966	0.03101	0.03275	0.03333	0.03441	0.02915	0.04482	0.08775	0.04001	0.05736	0.03166	0.03186	0.03746	0.09128	0.04596	0.05341	0.06228	0.06905	0.07052	0.03053	0.08191	0.03099	0.04471	0.04709	0.05912	0.05255	0.03039	0.06301	0.08239	0.15061	0.05700	0.05939	0.10452	0.06121	0.07302	0.10598	0.10949	0.05962	0.08052	0.08391	0.05216	0.07371	0.07551	0.09643	0.05047	0.05780	0.07810	0.05350	0.05719	0.05838	0.06686	0.06541	0.08446	0.02345	0.07795	0.08995	0.09111	0.09539	0.12118	0.08103	0.11391	0.11531	0.12181	0.17643	0.02996	0.06534	0.07941	0.07895	0.11385	0.11849	0.06195	0.09138	0.04474	0.11112	0.11432	0.04305	0.05796	0.07004	0.08941	0.05084	0.07867	0.08765	0.08499	0.12330	0.06564	0.10611	0.07520	0.07683	0.15199	0.06781	0.09358	0.11578	0.06303	0.07144	0.09736	0.10570	0.06139	0.06309	0.09258	0.13089	0.11006	0.05327	0.05756	0.16753	0.13582	0.10835	0.10217	0.10543	0.10901	0.12404	0.05299	0.09552	0.06180	0.06848	0.08434	0.09854	0.17279	0.04722	0.09971	0.12523	0.14320	0.16161	0.05911	0.08960	0.11056	0.04904	0.08895	0.09314	0.10504	0.17381	0.06186	0.09087	0.11202	0.11333	0.12632	0.19276	0.12328	0.07765	0.09446	0.12625	0.08007	0.14796	0.10589	0.11274	0.13860	0.17839	0.06751	0.12872	0.08471	0.08844	0.14832	0.21743	0.09192	0.09323	0.09457	0.10059	0.11572	0.14279	0.12915	0.06362	0.07898	0.09702	0.17837	0.21031	0.13298	0.15102	0.12412	0.12867	0.20801	0.14977	0.12340	0.09055	0.10164	0.12908	0.12652	0.20572	0.09381	0.15532	0.17483	0.19923	0.20815	0.17340	0.09119	0.11979	0.20401	0.13817	0.18513	0.21915	0.23528	0.27421	0.13095	0.19238	0.21411	0.17181	0.18052	0.17826	0.06727	0.17849	0.17545	0.23952	0.07804	0.08364	0.08494	0.16450	0.13287	0.17444	0.24458	0.19893	0.16243	0.16544	0.17699	0.23668	0.14019	0.20982	0.15953	0.21865	0.21189	0.14045	0.19558	0.20875	0.24453	0.14457	0.13005	0.15821	0.17226	0.20504	0.16716	0.17863	0.16472	0.20886	0.22023	0.16753	0.30246	0.22043	0.10025	0.21884	0.22609	0.28510	0.34180	0.19000	0.16129	0.10277	0.13942	0.14809	0.24530	0.21192	0.33347	0.15640	0.21449	0.26743	0.25413	0.28393	0.17376	0.23563	0.33427]';   % g, wet weights at f and T
units.LW = {'cm', 'g'};  label.LW = {'shell length', 'wet weight'};  bibkey.LW = 'Lee2015';
comment.LW = 'Data from Hong Kong';

% L-JX data
% max surface area spec ingestion rate (microg food/d cm2)assuming a feeding time of 24/24 hours
L_JX_X = [ ...    % Length (cm), Ingestion rate (microg/d), Food conc (mg/l)
1.65	10.79	1.08
1.68	12.44	1.43
1.64	12.84	1.32
1.71	14.34	1.52
1.67	15.42	1.58
1.65	17.36	1.59
1.70	20.84	1.80];
data.XJX = L_JX_X(:,[3 2]); 
units.XJX = {'mg/l', 'mug/d'}; label.XJX = {'food concentration', 'ingestion rate'};  
temp.XJX = C2K(25); units.temp.XJX = 'K'; label.temp.XJX = 'temperature'; bibkey.XJX = 'Lee2015';
auxData.length.XJX = L_JX_X(:, 1); 
units.length.XJX   = {'cm'};  label.length.XJX = {'Total length'};
treat.XJX = {0}; units.treat.XJX = ''; label.treat.XJX = '';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '45GHX'; % Cat of Life
metaData.links.id_ITIS = '81336'; % ITIS
metaData.links.id_EoL = '46470930'; % Ency of Life
metaData.links.id_Wiki = 'Mytilopsis_sallei'; % Wikipedia
metaData.links.id_ADW = 'Mytilopsis_sallei'; % ADW
metaData.links.id_Taxo = '877280'; % Taxonomicon
metaData.links.id_WoRMS = '397147'; % WoRMS
metaData.links.id_molluscabase = '397147'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mytilopsis_sallei}},'...
'note = {Accessed : 2017-07-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeFei2016'; type = 'Article'; bib = [ ... 
'author = {J. He and J. Fei Qi and D. Qing Feng and C. Huan Ke}, ' ... 
'year = {2016}, ' ...
'title = {Embryonic and larval development of the invasive biofouler \emph{Mytilopsis sallei}}, ' ...
'journal = {Journal of Molluscan Studies}, ' ...
'volume = {82}, ' ...
'number = {1}, '...
'pages = {23--30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mort1989'; type = 'Article'; bib = [ ... 
'author = {B. Morton}, ' ... 
'year = {1989}, ' ...
'title = {Life-history characteristic and sexual strategy of \emph{Mytilopsis sallei}, introduced into {H}ong {K}ong}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {219}, ' ...
'number = {1}, '...
'pages = {469--485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lee2015'; type = 'Misc'; bib = [ ...
'author = {A. Lee Sian Tan}, ' ...
'year = {2015}, ' ...
'howpublished = {Unpublished data}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
