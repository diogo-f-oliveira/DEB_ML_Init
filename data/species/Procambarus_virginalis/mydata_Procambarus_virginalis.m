function [data, auxData, metaData, txtData, weights] = mydata_Procambarus_virginalis

%% set metaData 
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Cambaridae';
metaData.species    = 'Procambarus_virginalis'; 
metaData.species_en = 'Marbled crayfish'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Aw', 'Cs', 'Cw'}; % Af, Am, Aw - tolerated; Cs, Cw - preferred (source https://www.cabi.org/isc/datasheet/110477)
metaData.ecoCode.ecozone = {'THp', 'TPam'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'}; % Marbled crayfish eat almost everything, but seem to prefer plant material and snails
metaData.ecoCode.gender  = {'D'}; 
metaData.ecoCode.reprod  = {'Apo'}; 

metaData.T_typical  = C2K(20); 
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'}; 
metaData.data_1     = {'t-L_T'; 't-Ww_T'; 'L-Ww';'L-N'; 'Ww-N'};

metaData.COMPLETE = 3.5; 

metaData.author   = {'Ana Dobrovic', 'Nina Marn'};    
metaData.date_subm = [2020 08 04];              
metaData.email    = {'ana.dobrovic@biol.pmf.hr'};            
metaData.address  = {'University of Zagreb - Faculty of Science, Croatia'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2020 08 05]; 


%% set data
% zero-variate data
data.ah = 20;    units.ah = 'd';    label.ah = 'age at hatching'; 	   bibkey.ah = 'VogtToll2004';  
  temp.ah = C2K(20);  units.temp.ah = 'K'; label.temp.ah = 'temperature'; % the temperature was 18-21 C
  comment.ah = 'Embryonic period lasts 17-22days, depending on conditions (VogtToll2004a); The embryonic period between spawning and hatching lasts 2?3weeks';
data.ab = 20+25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'VogtToll2004';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; % the temperature was 18-21 C
  comment.ab = 'Brood care period for stages 1-3: taken as 25 days; range 11?38 days (2-5 weeks)for carriage of the juveniles. They might use up the yolk a few days before the end of stage 3'; 
data.tp = 245 - 25;    units.tp = 'd';    label.tp = 'time since birth at puberty at 20 C';   bibkey.tp = 'VogtToll2004a';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'Computed as 35 weeks (245 days since hatching, first spawning at 20 C) - 25 days (from hatching to birth)'; 
data.am = 1154;    units.am = 'd';    label.am = 'life span';        bibkey.am = 'Vogt2010';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; % room temperature
  comment.am = 'Mean life span of the most long-lived 10% from Vogt2010 lab population'; 

data.Lh  = 0.35;   units.Lh  = 'cm';  label.Lh  = 'total length at hatching'; bibkey.Lh  = 'VogtToll2004a';
data.Lb  = 0.57;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'VogtToll2004a'; 
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'VogtToll2004a'; 
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'VogtFalc2015';
  comment.Li = 'TL: tip of rostrum to end of telson; largest in lab: 10.3cm (VogtFalc2015), 8.8cm in Vogt2010'; 
data.LCi  = 4.5;   units.LCi  = 'cm';  label.LCi  = 'ultimate carapace length'; bibkey.LCi  = 'VogtFalc2015';
  comment.LCi = 'Carapace length; largest in lab and nature 4.9cm CL'; 

data.Wwb = 0.0053;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'SeitVilp2005';
data.Wwp = 1.537;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'SeitVilp2005';
data.Wwi = 30;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'VogtFalc2015';
    comment.Wwi = 'largest in lab 30g, ever recorded in nature 32g (VogtFalc2015 and refs), largest in lab in Vogt2010: 23.5g'; 

data.Ri = 450/(8*7); units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = {'VogtFalc2015', 'VogtDorn2019','HossKoub2019'};
    comment.Ri = ['Temperature guessed; number of eggs based on larger crayfish in datasets (clutch size increases with the female size), ' ...
        'reproducing every 8-9 weeks all year round under very good conditions; '...
        '150-270 eggs for larger crayfish in VogtToll2004a, the largest clutches of marbled crayfish in the laboratory and the wild consisted of >720 eggs(VogtFalc2015 and refs)'];  
    temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.E0 = 55.56 * 1.5/2.22; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = {'RodrGarc2006', 'VogtToll2004a'};
comment.E0 = 'Based on Redclaw crayfish: egg diameter (2.22 mm) and energy (55.56 J/egg) [RodrGarc2006], and egg diameter of marble crayfish of 1.5mm [VogtToll2004a] ';

% uni-variate data
% in VogtHube2008 some crayfish were raised in a microplate and needed roughly 10 days to go through juv1 and juv2 stages, and then another 10 days to finish with juvenile 3 stage (see Fig1).
% According to VogtToll2004a, yolk reserves are available at least for the first half juv3 stage, so we take 15 days from hatching to birth
 % t-L data
data.tL1 = [ ... % time since hatching (days), total length (cm)
    48.839 48.839 48.932 50.029 50.115 50.691 50.823 50.823 71.729 72.258 72.258 72.258 72.258 72.258 72.258 73.317 95.148 95.942 95.942 95.942 95.942 95.942 95.942 96.604 111.026 111.026 111.026 111.026 111.026 111.026 111.026 111.158 149.397 150.059 150.059 150.059 150.059 150.059 150.059 151.382;
    1.8255 1.8682 1.7572 1.9074 1.6736 1.8255 1.7578 1.8718 2.6197 2.146 2.2457 2.3027 2.3882 2.4523 2.5057 2.6197 3.243 2.869 2.9474 3.0898 3.4211 3.5956 3.6632 3.2501 3.1326 3.2002 3.243 3.4887 3.535 3.9482 4.0372 3.7345 3.3961 3.4567 3.6632 3.909 4.1049 4.2758 4.3506 3.3997
    ]'; data.tL1(:,1) = data.tL1(:,1)-15; % go from hatching to birth
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length'}; bibkey.tL1 = 'VogtHube2008';
temp.tL1    = C2K(21);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
comment.tL1 = 'Crayfish raised in a microplate; age corrected from hatching to birth according to information in the paper';

data.tL2 = [ ... % time since hatching (days), total length (cm)
    258.401	258.401	258.401	258.401	258.401	258.401	258.401	364.523	365.140	364.832	364.832	364.369	364.969	365.688	435.511	454.467	455.714	454.203	454.203	453.987	453.771	558.505	558.505	558.67	560.521	559.081	558.053;
    5.3071	5.2131	5.1148	4.8285	4.6320	4.5252	4.3287	5.1105	5.2131	5.3156	5.5164	5.5469	5.7068	5.7434	6.4977	6.2019	6.1308	6.1069	5.8018	5.6015	5.4100	7.0879	6.3970	6.1032	6.1060	6.0861	5.8041
    ]'; data.tL2(:,1) = data.tL2(:,1)-15; % go from hatching to birth
units.tL2 = {'d', 'cm'};  label.tL2 = {'time since birth', 'total length'}; bibkey.tL2 = 'VogtHube2008';
temp.tL2 = C2K(21);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2 = 'Adult batch mates, kept communally; age corrected from hatching to birth according to information in the paper';
L0.tL2 = mean(data.tL2(round(data.tL2(:,1))== round(data.tL2(1,1)), 2)) ; units.L0.tL2 = {'cm'};  label.L0.tL2 = 'Average length at start of dataset';

% t-L data at different temperatures from Seitz et al (2005)
% For the growth experiments, juveniles were isolated immediately after they had left the mother and kept individually in temperature chambers at four different temperatures (15 C, 20 C, 25 C and 30 C) and two different photoperiods (18:6 and 6:18 light : dark).
% All individuals were fed with food pellets from the aquarium trade and chironomid larvae. The composition of the pellets was 47.5% raw protein, 6.5% raw fat, 2% raw fibre, 10.5% raw ash, and 6% water, added vitamins kg-1 pellets were A, 29 770 IE, D3, 1 860 IE, E, 200 mg and L-Ascorbyl?2? polyphosphate, 137 mg (Tetra company). 
% The weight of one pellet was 3.25 mg, the dry weight of one chironomid larva was approximately 0.95 mg. Both pellets and chironomid larvae were consumed eagerly. Food was added in excess. Every other day, the food was renewed and remaining food fragments were removed. 
% Cephalothorax length, total length, and weight were measured during each intermoult period.

data.tCL30 = [ ... % time since birth (days), carapace length (cm)
    0.395	0.838	1.441	5.768	6.642	9.542	10.207	12.892	15.789	16.908	20.924	22.491	25.383	25.614	28.292	29.19	32.09	32.978	33.421	34.992	36.104	36.559	38.104	41.012	41.908	42.813	43.478	45.262	45.49	46.815	51.064	53.078	53.535	54.871	56.192	58.893	62.683	64.682	65.593	66.693	78.525	103.727;
    0.3303	0.3637	0.4159	0.4485	0.4172	0.4607	0.504	0.4774	0.5442	0.5309	0.5877	0.561	0.6745	0.6078	0.6379	0.6045	0.6446	0.7014	0.7314	0.6714	0.7148	0.6447	0.8183	0.7883	0.775	0.6716	0.7183	0.7484	0.715	0.8518	0.8219	0.7986	0.7018	0.7486	0.9288	0.7453	0.8321	0.9389	0.7855	0.9357	1.0393	1.4736
    ]';
units.tCL30 = {'d', 'cm'};  label.tCL30 = {'time since birth', 'carapace length', '30 C'}; bibkey.tCL30 = 'SeitVilp2005';
temp.tCL30 = C2K(30);  units.temp.tCL30 = 'K'; label.temp.tCL30 = 'temperature';

data.tCL25 = [ ... % time since birth (days), carapace length (cm)
    0.649	0.865	3.676	3.892	7.135	7.351	11.027	11.459	13.189	14.27	16.865	17.73	18.811	20.541	20.757	23.568	23.784	24	26.162	28.324	28.757	29.405	30.703	31.568	35.459	36.108	39.784	41.297	41.297	42.162	43.892	44.757	44.973	46.486	49.73	50.378	51.676	51.676	54.919	55.784	56.865	58.595	59.243	59.676	60.541	63.784	65.946	66.811	67.676	67.892	78.919	79.568	80.865	81.73	87.568	88	88.432	89.73	89.946	94.703	96.649	96.649	102.27	103.135	106.811	107.892	112	116.108	117.405	117.622	118.486	118.919	121.514	122.595	127.351	127.351	129.081	130.162	132.108	139.027	139.676	141.622	142.703	151.568	152.432;
    0.35	0.3005	0.3995	0.3599	0.3896	0.4324	0.4126	0.472	0.4291	0.4885	0.4324	0.4852	0.5445	0.5116	0.4654	0.4852	0.5775	0.6072	0.5116	0.528	0.6632	0.5709	0.6204	0.5379	0.7358	0.5808	0.7655	0.6468	0.7259	0.6632	0.7655	0.8017	0.627	0.8215	0.7259	0.8248	0.8809	0.6863	0.8611	0.9138	0.8182	0.749	0.8677	0.9303	0.7358	0.96	0.9303	0.7885	0.9765	0.871	0.927	1.0259	1.1216	1.0259	1.1875	1.0292	1.1545	1.237	1.0754	1.3524	1.1348	1.3524	1.1315	1.4018	1.2667	1.4183	1.2337	1.4678	1.603	1.3128	1.603	1.3128	1.3722	1.3755	1.7382	1.7942	1.448	1.7909	1.4843	1.6689	2.0053	1.6162	2.0184	1.8932	1.8932
    ]';
units.tCL25 = {'d', 'cm'};  label.tCL25 = {'time since birth', 'carapace length', '25 C'}; bibkey.tCL25 = 'SeitVilp2005';
temp.tCL25 = C2K(25);  units.temp.tCL25 = 'K'; label.temp.tCL25 = 'temperature';

data.tCL20 = [ ... % time since birth (days), carapace length (cm)
    0.418	0.866	1.977	3.317	5.766	6.875	8.213	8.217	9.772	11.111	11.331	12.445	14.006	14.894	15.567	17.567	19.792	19.796	21.804	23.581	24.691	24.92	27.59	28.707	31.149	31.603	32.266	34.942	39.166	39.172	39.177	40.061	43.182	44.514	45.856	46.75	47.183	50.307	51.647	52.53	53.875	55.437	55.651	57.436	57.877	61.215	61.222	61.885	64.554	69.021	69.231	69.459	71.466	73.688	75.253	77.023	77.025	78.369	79.268	79.921	80.814	81.262	83.268	83.939	87.048	89.047	92.612	92.613	94.175	95.955	97.294	98.198	101.078	101.084	101.304	103.301	104.185	107.086	112.012	112.655	112.884	114.668	115.77	116.448	116.668	119.339	120.891	124.028	124.492	124.916	125.352	128.255	130.032	132.028	135.836	136.064	136.716	136.721	137.862	142.29	143.398	145.165	147.863	147.872	148.306	148.982	149.211	153.452	155.207	155.419	162.122	163.022	164.118	165.461	167.897	170.355	172.358	178.384	182.166	182.381	187.508	197.083	197.085	210.461	213.11	215.123	215.126;
    0.3384	0.3783	0.3517	0.4116	0.4215	0.3649	0.3882	0.4448	0.4015	0.4581	0.4081	0.4248	0.468	0.4281	0.508	0.4647	0.438	0.5013	0.5579	0.5179	0.4746	0.5645	0.5345	0.601	0.5078	0.6243	0.5644	0.6209	0.5443	0.6375	0.7108	0.6209	0.6774	0.6275	0.714	0.774	0.5975	0.7007	0.7573	0.6574	0.7939	0.8504	0.7239	0.7772	0.7172	0.7039	0.8037	0.7338	0.7071	0.9235	0.747	0.8236	0.8735	0.8169	0.9101	0.7603	0.7869	0.9001	1.0133	0.8102	0.8468	0.8867	0.9267	0.9666	0.8667	0.8034	0.85	0.8699	0.9132	0.8999	0.9531	1.1462	0.9531	1.0397	1.003	0.9098	0.8165	0.913	1.3159	0.9729	1.0661	1.0994	0.9462	1.0961	1.0528	1.0494	0.9695	1.2558	1.5188	1.2225	1.0893	1.2191	1.1725	1.0659	1.4022	1.4754	1.2523	1.3222	1.7085	1.3721	1.3122	1.109	1.4919	1.6118	1.4553	1.5718	1.665	1.8248	1.4618	1.3087	1.6682	1.7947	1.555	1.6582	1.485	1.6115	1.6115	1.8345	1.8045	1.6946	1.7977	1.8276	1.8575	2.1437	1.8274	1.9672	2.0038
    ]';
units.tCL20 = {'d', 'cm'};  label.tCL20 = {'time since birth', 'carapace length', '20 C'}; bibkey.tCL20 = 'SeitVilp2005';
temp.tCL20 = C2K(20);  units.temp.tCL20 = 'K'; label.temp.tCL20 = 'temperature';

data.tCL15 = [ ... % time since birth (days), carapace length (cm)
    0.873	0.431	5.565	4.681	6.908	3.783	5.796	15.841	19.657	19.651	19.647	22.765	27.467	29.023	35.055	51.602	48.694	50.924	52.700	54.932	61.864	63.431	68.783	73.916	91.580	90.902	115.261	117.040	131.110	136.928	147.202	146.973	168.874	167.080	171.321	190.990	195.000;
    0.3123	0.3603	0.3294	0.4186	0.3602	0.3706	0.4014	0.3532	0.5212	0.4732	0.4389	0.3565	0.4628	0.3941	0.4146	0.5892	0.5481	0.5172	0.428	0.4142	0.4895	0.5204	0.4448	0.4138	0.5953	0.5267	0.6601	0.5845	0.5843	0.6837	0.6903	0.6423	0.7654	0.7002	0.6761	0.813	0.7203
    ]';
units.tCL15 = {'d', 'cm'};  label.tCL15 = {'time since birth', 'carapace length', '15 C'}; bibkey.tCL15 = 'SeitVilp2005';
temp.tCL15 = C2K(15);  units.temp.tCL15 = 'K'; label.temp.tCL15 = 'temperature';

% t-Ww data
% 3rd stage juveniles were kept individually to prevent cannibalism. Water temperature 22.8-1.5 C.
% Animals were fed by freshly hatched, tapwater-rinsed brine shrimp (Artemia salina) nauplii ad libitum one time daily.
data.tW = [ ... % time since hatching (days), wet weight (g)
    28.990      38.001      44.991      53.021;
    0.007253	0.010996	0.01449     0.01833]';
data.tW(:,1) = data.tW(:,1)-24; % go from hatching to birth
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'}; bibkey.tW = 'VeliStar2014';
temp.tW = C2K(22.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
comment.tW = '3rd developmental stage was reached at 24 days. Age corrected from hatching to birth according to information in the paper';

% t-Ww data at different temperatures from Seitz et al (2005)
data.tWw30 = [ ... % time since birth (days), wet weight (g)
    0.05	1.86	3.466	5.878	10.099	12.109	15.324	19.344	21.353	25.574	27.584	30.397	33.01	36.225	38.238	39.04	41.854	42.253	44.266	45.675	46.474	47.08	50.496	53.306	53.309	55.52	56.126	58.13	62.754	65.767	65.973	78.839	103.786;
    0.0149	0.0240	0.0148	0.0178	0.0360	0.0360	0.0359	0.0511	0.0480	0.0693	0.0662	0.0631	0.0844	0.0813	0.1240	0.0965	0.1086	0.0720	0.1177	0.1543	0.0842	0.1268	0.1329	0.0901	0.1237	0.1358	0.1816	0.1053	0.1388	0.1204	0.1966	0.2635	0.6869]';
units.tWw30 = {'d', 'g'}; label.tWw30 = {'time since birth', 'wet weight', '30 C'}; bibkey.tWw30 = 'SeitVilp2005';
temp.tWw30 = C2K(30);  units.temp.tWw30 = 'K'; label.temp.tWw30 = 'temperature';

data.tWw25 = [ ... % time since birth (days), wet weight (g)
    0.123	3.083	5.778	8.473	11.529	12.43	14.765	16.92	18.54	20.514	22.495	23.029	23.933	26.085	28.068	30.584	31.298	35.259	35.431	39.572	41.543	43.167	45.137	46.225	48.56	49.452	50.717	52.327	52.517	55.934	57.362	59.887	60.236	63.306	66.36	66.887	68.69	68.696	78.934	79.844	80.929	82.539	87.931	87.946	89.93	90.808	95.693	96.746	101.956	103.071	107.006	107.573	107.749	112.031	116.028	117.274	117.309	118.532	118.747	122.116	127.026	127.611	128.623	130.664	131.834	138.192	139.193	139.45	141.034	142.65	143.141	143.145	152.079;
    0.0165	0.0159	0.0131	0.0131	0.0158	0.0404	0.0321	0.0184	0.0402	0.0210	0.0566	0.0183	0.0565	0.0237	0.0701	0.0701	0.0400	0.0973	0.0371	0.0945	0.0562	0.1081	0.0534	0.1299	0.1217	0.0724	0.1298	0.0696	0.1517	0.1707	0.0969	0.1707	0.0886	0.2007	0.1979	0.1103	0.1513	0.2006	0.1621	0.2496	0.3015	0.2495	0.2521	0.3670	0.4217	0.2658	0.5145	0.3258	0.3230	0.5910	0.4596	0.6647	0.6401	0.4075	0.7357	0.6454	0.9079	0.6454	0.9079	0.5714	1.0089	1.3453	0.8530	1.3371	0.6834	1.1920	1.9523	1.1919	0.9430	0.9402	1.9112	1.9413	1.5636]';
units.tWw25 = {'d', 'g'}; label.tWw25 = {'time since birth', 'wet weight', '25 C'}; bibkey.tWw25 = 'SeitVilp2005';
temp.tWw25 = C2K(25);  units.temp.tWw25 = 'K'; label.temp.tWw25 = 'temperature';

data.tWw20 = [ ... % time since birth (days), wet weight (g)
    0.126	3.009	4.631	6.974	9.497	14.004	14.363	17.428	20.131	22.654	25.537	30.044	30.402	34.189	37.975	38.513	42.119	44.645	45.902	46.085	47.348	48.065	50.05	52.751	52.934	55.82	56.357	60.324	61.403	64.646	67.714	68.618	68.973	72.4	73.299	75.105	76.725	77.263	78.712	79.791	80.148	82.312	83.757	85.556	88.257	90.421	92.945	95.47	97.633	98.182	101.061	101.958	103.938	106.823	111.708	112.235	112.412	115.121	115.659	115.835	118.721	121.062	123.961	124.159	124.857	125.032	127.743	130.082	132.059	135.501	135.507	136.033	136.756	136.971	137.835	138.773	140.008	142.171	143.247	144.138	145.76	147.948	148.137	148.302	149.036	149.045	153.039	154.779	154.793	161.48	161.854	163.811	164.017	165.089	166.531	167.768	171.03	178.626	181.677	181.85	186.011	187.272	196.646	196.647	196.654	209.822	211.789	213.051	213.976	213.98;
    0.0221	0.0220	0.0192	0.0219	0.0163	0.0436	0.0162	0.0353	0.0352	0.0324	0.0351	0.0514	0.0213	0.0595	0.0813	0.0375	0.0621	0.1086	0.0373	0.0784	0.1167	0.0509	0.0838	0.0563	0.1083	0.1466	0.0808	0.1246	0.0780	0.0697	0.1463	0.1846	0.0969	0.1434	0.1105	0.1707	0.1406	0.0912	0.2282	0.1788	0.1186	0.1404	0.2116	0.1540	0.1156	0.1375	0.1484	0.1866	0.1975	0.3345	0.2550	0.1947	0.1508	0.1672	0.5067	0.2739	0.2136	0.3149	0.2601	0.1861	0.2408	0.2051	0.4790	0.7831	0.3968	0.2927	0.4351	0.3693	0.2706	0.5910	0.7006	0.4403	0.4787	1.0758	0.4403	1.0758	0.6155	0.6127	0.5360	0.3552	0.3524	0.7989	0.9577	0.6811	0.9084	1.0755	1.5849	0.5001	0.7384	1.0834	1.3217	0.8724	1.3189	1.1573	1.1572	0.7244	1.0530	1.5130	1.2910	1.1650	1.4471	1.4470	1.4851	1.5016	1.6248	1.8546	1.5779	1.5778	2.0024	2.0791]';
units.tWw20 = {'d', 'g'}; label.tWw20 = {'time since birth', 'wet weight', '20 C'}; bibkey.tWw20 = 'SeitVilp2005';
temp.tWw20 = C2K(20);  units.temp.tWw20 = 'K'; label.temp.tWw20 = 'temperature';

data.tWw15 = [ ... % time since birth (days), wet weight (g)
    0.036	5.398	15.229	19.032	20.368	23.272	27.296	28.634	34.22	49.194	51.875	52.764	54.775	61.48	64.162	68.405	73.543	90.527	92.318	114.66	117.114	130.968	137.003	147.055	147.059	166.72	168.733	170.965	189.964	194.203;
    0.0163	0.0161	0.0191	0.0462	0.0189	0.0154	0.0289	0.0152	0.0150	0.0451	0.0450	0.0178	0.0143	0.0310	0.0378	0.0206	0.0204	0.0402	0.0605	0.0597	0.0392	0.0455	0.0623	0.0483	0.0722	0.0680	0.0850	0.0679	0.1148	0.0807]';
units.tWw15 = {'d', 'g'}; label.tWw15 = {'time since birth', 'wet weight', '15 C'}; bibkey.tWw15 = 'SeitVilp2005';
temp.tWw15 = C2K(15);  units.temp.tWw15 = 'K'; label.temp.tWw15 = 'temperature';


% length-weight
data.LW_Vogt2010 = [ ... % total length (cm), wet weight (g)
    1.902	2.191	2.296	2.493	2.69	2.808	2.997	3.079	3.207	3.289	3.405	3.44	3.604	3.452	3.604	3.907	3.926	4.125	4.083	4.199	4.283	4.314	4.283	4.409	4.598	4.619	4.692	4.766	4.902	4.797	4.808	5.06	5.448	5.186	5.102	5.396	5.542	5.501	5.406	5.595	5.595	5.795	5.9	6.005	6.11	5.911	5.911	5.795	6.205	6.404	6.415	6.294	6.494	6.505	6.804	6.867	7.106	7.006	7.296	6.904	7.597	7.8	8.167	8.342	8.343	8.103	8.6	8.621	8.803;
    0.367	0.367	0.367	0.34	0.471	0.655	0.649	0.742	0.579	0.765	0.695	0.905	0.975	1.324	1.301	1.138	1.922	1.901	1.566	1.545	1.65	2.027	2.299	2.236	2.76	2.299	2.53	2.907	2.823	2.509	2.006	2.551	2.823	3.284	3.892	3.263	2.907	3.598	4.143	4.122	4.709	4.52	4.73	4.688	5.086	5.421	5.861	6.636	6.029	6.51	6.971	7.187	7.446	8.025	7.506	9.793	9.401	10.312	10.91	7.566	13.819	13.372	15.815	15.594	15.595	16.815	17.486	18.087	19.877]';
units.LW_Vogt2010 = {'cm', 'g'};     label.LW_Vogt2010 = {'total length', 'wet weight'};
bibkey.LW_Vogt2010 = 'Vogt2010';

data.LW_ParvTogo2017 = [ ... % total length (cm), wet weight (g)
    9.425	8.406	7.383	7.183	9.245	9.205	9.493	8.432	8.744;
    20.91	15.12	10.48	9.31	19.25	17.95	21.16	15.69	17.32]';
units.LW_ParvTogo2017 = {'cm', 'g'};     label.LW_ParvTogo2017 = {'total length', 'wet weight'};
bibkey.LW_ParvTogo2017 = 'ParvTogo2017';

data.LW_Ziza2015 = [ ... % total length (cm), wet weight (g)
    9.013	7.417	7.981	7.341	8.446	7.167	7.809	7.526	8.090	7.370	8.309	6.664	6.621	7.150	6.774	5.392	5.081	6.125	7.013	6.339	5.189	3.774	7.196	7.447	8.352	7.360	7.566	6.797	7.279	6.924	7.320	7.071	6.788	6.247	6.355	6.703	6.796	6.614	7.328	6.043	6.477	7.586	5.790	5.393	6.605	6.319;
    17.362	9.905	10.755	10.907	11.000	8.000	11.000	9.000	11.472	9.057	13.628	6.659	6.121	7.586	6.697	3.232	2.564	4.664	6.609	6.041	2.825	1.091	8.560	11.625	14.750	10.358	11.113	6.805	9.171	7.835	9.665	9.183	6.888	5.509	7.309	7.154	7.737	7.818	9.653	5.482	6.380	11.287	4.332	3.376	6.657	5.732]';
units.LW_Ziza2015 = {'cm', 'g'};     label.LW_Ziza2015 = {'total length', 'wet weight'};
bibkey.LW_Ziza2015 = 'Ziza2015';

data.LW_HossKoub2019 = [ ... % total length (cm), wet weight (g)
    2.61	4.19	2.94	3.50	3.15	4.19	3.64	2.96	3.82	2.91	3.55	3.41	3.35	3.20	3.90	3.61	3.84	3.90	2.89	3.39	3.43	3.63	4.21	3.65	3.40	3.43	4.19	3.26	4.35	2.97	3.35	3.28	3.30	7.54	6.67	6.17	7.41	6.05	6.46	5.38	6.53	6.67	4.63	6.99	6.08	5.58	5.70	5.54	4.67	4.98	7.00	6.33	6.73	6.11	5.25	6.04	6.74	3.74	4.34	4.11	4.46	4.16	4.40	4.51	4.62	4.24	4.47	4.79	4.15	4.78	4.51	4.76	4.84	4.87	4.67	5.14	3.97	4.68	5.12	5.34	5.15	5.17	5.14	4.81	4.44	4.81	4.74	4.50	4.54	8.34	6.96	7.00	4.34	5.17	4.34	5.06	4.79	5.05	4.92	5.42	5.11	6.55	7.24	6.85	5.40	4.75	4.34	5.21	5.59	5.82	8.32	5.94	4.76	5.45	5.39	5.24	5.97	5.51	5.49	6.42	5.75	7.13	8.79	6.82	6.39	5.64	4.80	5.80	6.27	5.22	6.16	6.43;
    0.40	1.62	0.58	1.05	0.64	1.16	0.77	0.66	1.21	0.65	1.04	0.94	0.97	0.75	0.99	1.18	1.13	1.35	0.54	0.53	0.61	1.05	1.62	0.69	0.90	0.87	1.03	0.93	1.27	0.56	0.83	0.83	0.94	11.38	6.63	5.28	8.50	4.81	6.02	3.94	6.30	6.18	2.46	7.93	5.44	3.82	4.21	3.60	2.28	3.20	6.66	5.45	7.19	4.80	2.90	5.00	4.91	0.90	1.70	1.50	2.00	1.40	1.90	1.80	2.00	1.60	1.80	1.80	1.30	2.20	1.70	2.20	2.40	2.20	2.40	2.40	1.50	2.10	2.30	2.90	2.70	2.70	2.70	2.10	1.80	2.20	2.00	1.90	2.20	12.40	6.30	6.30	2.30	2.70	2.80	2.40	2.20	2.60	2.60	2.70	3.00	5.90	7.80	7.40	3.20	2.30	3.20	3.10	3.30	4.50	11.90	4.20	2.30	3.70	2.70	3.30	4.20	3.90	3.80	5.30	4.00	7.60	14.50	7.60	5.80	4.40	2.30	4.00	5.00	2.90	4.90	6.10]';
units.LW_HossKoub2019 = {'cm', 'g'};     label.LW_HossKoub2019 = {'total length', 'wet weight'};
bibkey.LW_HossKoub2019 = 'HossKoub2019';


% length-# of eggs
data.LN_Vogt = [ ... % total length (cm), number of eggs (#)
    3.4	4.1	4.3	4.8	4.6	4.9	5.5	5.9	6.0	6.3	6.2	6.9	7.1	7.1	8.0	10.3;
    51	77	54	71	94	177	161	271	298	204	286	230	310	422	589	731]';
units.LN_Vogt = {'cm', '#'};  label.LN_Vogt = {'total length', 'number of eggs'};
temp.LN_Vogt = C2K(20);  units.temp.LN_Vogt = 'K'; label.temp.LN_Vogt = 'temperature';
bibkey.LN_Vogt = 'VogtDorn2019'; % laboratory population of G. Vogt

data.LN_HossKoub2019 = [ ... % total length (cm), number of eggs (#)
    5.018	4.616	6.507	5.642	4.656	4.113	4.334	4.375	4.717	4.053	4.797	6.668	5.179	4.375	4.455	5.765	4.495	5.296	5.612	5.515	5.473	5.081	4.596	5.006	4.791	5.222	5.352	5.027	4.946	5.362	4.536	4.849	4.972	4.510	5.196	4.755	4.658	4.793	4.443	4.630	5.320	5.803	5.018	5.039	5.481	5.139	4.676	5.159	4.435	5.039	4.958	4.918	5.119	5.220	4.777	4.676	4.596	4.737	4.073	4.254	4.113	4.133	4.878	4.797	5.542	5.401	5.662	5.863	5.501	5.843	5.602	5.381	5.763	6.286	5.220	4.516	4.576	5.220	5.904	5.260	5.401	5.642	4.797	4.334	4.355	4.334	7.775	5.521	5.280	4.556	4.254	4.878	4.576	5.924	6.386	5.863	5.300	4.415	4.254	4.113	4.576	5.938	6.302	5.702	4.632	5.531	4.196	3.995	3.978	6.547	5.163	5.944	6.024	5.461	5.863	5.542	5.200	5.723	6.507	5.582	5.401	4.858	5.924	5.119	6.044	5.119	4.837	4.556	7.111	6.145	5.662	5.803	5.904	7.030;
    121	141	320	225	121	104	133	120	89	101	136	308	169	94	109	196	74	80	142	187	150	152	114	141	80	167	188	122	99	136	89	125	128	97	128	98	70	134	88	61	142	154	160	128	91	130	120	168	93	147	126	102	143	134	108	75	81	120	80	96	96	98	141	128	233	170	131	148	208	233	189	164	237	392	148	53	128	97	228	173	172	233	183	111	121	96	385	222	214	112	83	156	142	266	340	225	237	125	116	113	99	72	110	74	123	232	69	64	58	252	104	158	173	207	169	244	116	152	247	171	112	177	259	149	193	144	115	95	524	263	275	198	243	388]';
units.LN_HossKoub2019 = {'cm', '#'};  label.LN_HossKoub2019 = {'total length', 'number of eggs'};
temp.LN_HossKoub2019 = C2K(20);  units.temp.LN_HossKoub2019 = 'K'; label.temp.LN_HossKoub2019 = 'temperature';
bibkey.LN_HossKoub2019 = 'HossKoub2019'; % TL computed from CL

% weigth-# of eggs
data.WN = [ ... % wet weight (g), number of eggs (#)
    4	3.2	9.3	6.6	3.6	2.3	2.6	2.6	4.1	2.1	3.9	10.4	4.7	2.6	2.9	5.4	2.3	4	4.7	4.3	4.9	3.5	2.7	3.6	3	4.1	4.5	3.4	3.2	4.2	2.6	3	3.1	2.6	3.8	2.6	2.6	3	2.4	2.8	4.2	5.1	3.3	3.4	4.6	3.8	2.8	3.49	2.36	3.41	3.19	3.26	3.88	3.83	2.94	2.77	2.7	2.75	1.74	1.93	1.9	1.81	3.65	2.93	4.34	4.14	4.82	5.19	4.27	5.2	4.75	4.34	5.15	7	3.9	2.13	2.42	3.8	6.09	3.94	4.64	5	3.01	2.01	2.08	2.05	13.51	4.67	4.12	2.48	1.99	2.9	2.22	5.57	6.47	5.54	4.1	2.12	1.88	1.82	2.44	6	6.71	5.3	2.29	4.15	1.89	1.56	1.56	7.23	3.42	5.98	5.81	4.62	6.04	4.6	4.04	5.31	7.19	4.47	4.41	3.16	4.9	3.62	6.04	3.5	2.98	2.29	9.8	7.65	5.07	5.06	5.65	10.11;
    121	141	320	225	121	104	133	120	89	101	136	308	169	94	109	196	74	80	142	187	150	152	114	141	80	167	188	122	99	136	89	125	128	97	128	98	70	134	88	61	142	154	160	128	91	130	120	168	93	147	126	102	143	134	108	75	81	120	80	96	96	98	141	128	233	170	131	148	208	233	189	164	237	392	148	53	128	97	228	173	172	233	183	111	121	96	385	222	214	112	83	156	142	266	340	225	237	125	116	113	99	72	110	74	123	232	69	64	58	252	104	158	173	207	169	244	116	152	247	171	112	177	259	149	193	144	115	95	524	263	275	198	243	388]';
units.WN = {'g', '#'};  label.WN = {'wet weight', 'number of eggs'};
temp.WN = C2K(20);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'HossKoub2019';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 2 * weights.ab;  % more weight to age at birth
weights.ah = 2 * weights.ah;  % more weight to ah 
weights.Lh = 2 * weights.Lh;  % more weight to Lh 
weights.E0 = 3 * weights.E0;  % more weight to E_0
weights.tL1 = 3 * weights.tL1;  % more weight to tL for little ones
weights.tL2 = 3 * weights.tL2;  % more weight to tL for larger ones
weights.tCL30 = 0.2 * weights.tCL30;  % less weight to tricky temps, more weight to optima
weights.tWw30 = 0.2 * weights.tWw30;  % less weight to tricky temps, more weight to optima
weights.tCL15 = 0.2 * weights.tCL15;  % less weight to tricky temps, more weight to optima
weights.tWw15 = 0.2 * weights.tWw15;  % less weight to tricky temps, more weight to optima
weights.tCL20 = 3 * weights.tCL20;  % less weight to tricky temps, more weight to optima
weights.tWw20 = 3 * weights.tWw20;  % less weight to tricky temps, more weight to optima
weights.tCL25 = 3 * weights.tCL25;  % less weight to tricky temps, more weight to optima
weights.tWw25 = 3 * weights.tWw25;  % less weight to tricky temps, more weight to optima
weights.Wwb = 5 * weights.Wwb;      % more weight to weight at birth

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
auxData.L0 = L0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Age - Length from VogtHube2008'};
set2 = {'LW_Vogt2010','LW_ParvTogo2017','LW_Ziza2015','LW_HossKoub2019'}; subtitle2 = {'Length-Wet weight data from 4 sources'};
set3 = {'LN_Vogt', 'LN_HossKoub2019'};  subtitle3 = {'length-# of eggs from 2 sources'};
set4 = {'tCL30', 'tCL25', 'tCL20', 'tCL15'}; subtitle4 = {'age - length at 15, 20, 25 and 30 C'};
set5 = {'tWw30','tWw25','tWw20','tWw15'}; subtitle5 = {'age - wet weight at 15, 20, 25 and 30 C'};
    
metaData.grp.sets = {set1,set2,set3,set4,set5};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Discussion points
D1 = 'Model  std is applied, instead of abj, since freshwater crayfish, unlike marine decapods, have no larval stage';
metaData.discussion = struct('D1',D1);  

%% Facts 
F1 = 'Eggs are glued to hairs under the abdomen; after hatching the young continue to cling to the hairs, moult 2 or 3 times and a miniature crayfish walks off';
metaData.bibkey.F1 = 'VogtToll2004a'; 
F2 = 'Reproduction exclusively by parthenogenesis, no male specimen found';
metaData.bibkey.F2 = 'VogtToll2004a'; 
F3 = 'Not much is known about the species, common in aquariums,  best cultured at temperatures of 18-25 C. Maximum growth is obtained at 25 C and maximum survival at 20 C';
metaData.bibkey.F3 = 'VogtToll2004a'; 
F4 = ['Life cycle can be subdivided into 5 stages: (1) embryo, (2) juvenile stages 1-3 (brood period), (3) differentiation of sexual organs from stage 4 juveniles to 2cm TL adolescents,'...
    '(4) gonadal maturatation (2cm to 4cm TL), (5) the adult reproducing period (4cm to 12cm TL). Duration of each stage but also mean size of crayfish at each stage' ...
    'depend on rearing conditions'];
metaData.bibkey.F4 = 'VogtToll2004a'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '7WLYV'; % Cat of Life
metaData.links.id_ITIS = '1134174'; % ITIS
metaData.links.id_EoL = '52207817'; % Ency of Life
metaData.links.id_Wiki = 'Procambarus_virginalis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5610562'; % Taxonomicon
metaData.links.id_WoRMS = '1049466'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Marbled_crayfish}}';
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
bibkey = 'HossKoub2019'; type = 'Article'; bib = [ ...
'author = {Hossain, Md Shakhawate and Kouba, Antonin and Burie, Milos}, ' ...
'year = {2019}, ' ...
'title = {Morphometry, size at maturity, and fecundity of marbled crayfish (\textit{Procambarus virginalis})}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {281}, ' ...
'pages = {68-75}, ' ...
'doi = {10.1016/j.jcz.2019.06.005}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParvTogo2017'; type = 'Article'; bib = [ ...
'author = {Parvulescu, Lucian and Togor, Andrei and Lele, Sandra-Florina and Scheu, Sebastian and Sinca, Daniel and Panteleit, J\"{o}rn}, ' ...
'year = {2017}, ' ...
'title = {First established population of marbled crayfish \emph{Procambarus fallax} ({H}agen, 1870) \emph{f. virginalis} ({D}ecapoda, {C}ambaridae) in {R}omania}, ' ...
'journal = {BioInvasions Records}, ' ...
'volume = {6}, ' ...
'pages = {357-362}, ' ...
'doi = {10.3391/bir.2017.6.4.09}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrGarc2006'; type = 'Article'; bib = [ ...
'author = {Rodriguez-Gonzalez, Hervey and Garcia-Ulloa, Manuel and Hernandez-Llamas, Alfredo and Villarreal, Humberto}, ' ...
'year = {2006}, ' ...
'title = {Effect of dietary protein level on spawning and egg quality of redclaw crayfish \textit{Cherax quadricarinatus}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {257}, ' ...
'pages = {412--419}, ' ...
'doi = {10.1016/j.aquaculture.2006.01.020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeitVilp2005'; type = 'Article'; bib = [ ...
'author = {Seitz, Robert and Vilpoux, Kathia and Hopp, Ulrich and Harzsch, Steffen and Maier, Gerhard}, ' ...
'year = {2005}, ' ...
'title = {Ontogeny of the Marmorkrebs (marbled crayfish): a parthenogenetic crayfish with unknown origin and phylogenetic position},' ...
'journal = {Journal of experimental zoology. Part A, Comparative experimental biology},' ...
'volume = {303}, ' ...
'pages = {393-405}, ' ...
'doi = {10.1002/jez.a.143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VeliStar2014'; type = 'Article'; bib = [ ...
'author = {Velisek, Josef and Stara, Alzbeta and Koutnik, Dalibor and Zuskova, Eliska and Kouba, Antonin}, ' ...
'year = {2014}, ' ...
'title = {Effect of prometryne on early life stages of marbled crayfish (\textit{Procambarus fallax f. virginalis})}, '...
'journal = {Neuroendocrinology letters}, ' ...
'volume = {35}, '...
'pages = {93-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtToll2004'; type = 'Article'; bib = [ ...  
'author = {Vogt, Gunter and Tolley, Laura}, ' ...
'year = {2004}, ' ...
'title = {Brood care in freshwater crayfish and relationship with the offsprings sensory deficiencies}, ' ...
'journal = {Journal of morphology}, ' ...
'volume = {262}, ' ...
'pages = {566-82},' ...
'doi = {10.1002/jmor.10169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtToll2004a'; type = 'Article'; bib = [ ...  
'author = {Vogt, Gunter and Tolley, Laura and Scholtz, Gerhard}, ' ...
'year = {2004}, ' ...
'title = {Life stages and reproductive components of the Marmorkrebs (Marbled Crayfish), the first parthenogenetic decapod crustacean}, ' ...
'journal = {Journal of morphology}, ' ...
'volume = {261}, ' ...
'pages = {286-311}, ' ...
'doi = {10.1002/jmor.10250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtHube2008'; type = 'Article'; bib = [ ... 
'author = {Vogt, Gunter and Huber, Martin and Thiemann, Markus and Boogaart, Gerald and Schmitz, Oliver and Schubart, Christoph}, ' ...
'year = {2008}, ' ...
'title = {Production of different phenotypes from the same genotype in the same environment by developmental variation}, ' ...
'journal = {The Journal of experimental biology}, ' ...
'volume = {211}, ' ...
'pages = {510-23}, ' ...
'doi = {10.1242/jeb.008755}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vogt2010'; type = 'Article'; bib = [ ... 
'author = {Vogt, Gunter}, ' ...
'year = {2010}, ' ...
'title = {Suitability of the clonal marbled crayfish for biogerontological research: {A} review and perspective, with remarks on some further crustaceans}, ' ...
'journal = {Biogerontology}, ' ...
'volume = {11}, ' ...
'pages = {643-69}, ' ...
'doi = {10.1007/s10522-010-9291-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtFalc2015'; type = 'Article'; bib = [ ... 
'author = {Vogt, Gunter and Falckenhayn, Cassandra and Schrimpf, Anne and Schmid, Katharina and Hanna, Katharina and Panteleit, Jorn and Helm, Mark and Schulz, Ralf and Lyko, Frank}, ' ...
'year = {2015}, ' ...
'title = {The marbled crayfish as a paradigm for saltational speciation by autopolyploidy and parthenogenesis in animals}, ' ...
'journal = {Biology Open}, ' ...
'volume = {4 (11)}, ' ...
'pages = {1583 -- 1594}, ' ...
'url = {https://pubmed.ncbi.nlm.nih.gov/26519519}, ' ...
'doi = {10.1242/bio.014241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtDorn2019'; type = 'Article'; bib = [ ...  
'author = {Vogt, Gunter and Dorn, Nathan and Pfeiffer, Michael and Lukhaup, Chris and Williams, Bronwyn and Schulz, Ralf and Schrimpf, Anne}, ' ...
'year = {2019}, ' ...
'title = {The dimension of biological change caused by autotriploidy: {A} meta-analysis with triploid crayfish \emph{Procambarus virginalis} and its diploid parent \emph{Procambarus fallax}}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {281}, ' ...
'pages = {53-67}, ' ...
'doi = {10.1016/j.jcz.2019.06.006}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ziza2015'; type = 'Thesis'; bib = [ ...
'author = {Anita Zizak}, ' ...
'year = {2015}, ' ...
'title = {Organosomatski indeksi invazivne vrste \textit{Procambarus fallax} ({H}agen, 1870) \textit{f. virginalis} iz jezera {S}oderica ({K}oprivnica)}, ' ...
'school={Faculty of Science, University of Zagreb (HR)}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
