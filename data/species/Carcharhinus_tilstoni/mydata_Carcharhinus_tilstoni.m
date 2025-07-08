function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_tilstoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_tilstoni'; 
metaData.species_en = 'Australian Blacktip shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data

data.ab = 10*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'Wiki';   
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'DaveStev1988';   
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 60;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
data.Lp  = 165;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 200;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 65e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00479*Li^3.10, see F1; fishbase give 52 kg';

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-6 pups per litter, 1 litter each yr';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.107	57.634
0.107	61.935
0.124	80.430
0.160	84.731
0.284	67.527
0.302	64.086
0.639	74.839
0.675	67.097
0.675	70.108
0.692	84.731
0.817	86.452
0.817	89.892
0.834	77.419
0.834	74.839
0.834	73.548
0.852	80.860
0.852	83.441
0.870	78.710
0.888	73.978
0.923	84.301
0.923	82.151
0.923	80.860
0.976	98.495
1.243	86.022
1.243	91.613
1.278	93.763
1.580	101.935
1.598	80.000
1.598	77.849
1.598	75.269
1.598	72.688
1.704	96.344
1.704	88.602
1.704	86.452
1.793	98.925
1.828	83.871
1.828	86.452
1.828	101.075
1.846	92.903
1.935	96.344
1.935	98.925
1.953	102.796
1.953	104.946
1.988	79.140
2.183	83.871
2.592	96.344
2.609	77.419
2.609	86.022
2.609	87.742
2.609	89.892
2.609	110.538
2.627	91.613
2.627	93.763
2.680	101.075
2.680	108.387
2.858	109.677
2.858	87.312
2.876	118.280
2.893	98.925
2.947	118.710
2.947	116.129
2.947	94.194
3.036	98.925
3.124	122.581
3.266	114.839
3.266	119.570
3.515	125.591
3.586	91.183
3.586	92.473
3.586	94.624
3.586	98.495
3.586	101.935
3.586	113.978
3.604	106.237
3.604	111.828
3.675	111.398
3.692	102.796
3.692	106.237
3.692	117.419
3.710	131.613
3.834	126.452
3.852	124.301
3.888	115.699
3.941	140.215
3.941	130.753
3.941	117.419
4.118	116.989
4.207	132.473
4.278	130.753
4.544	106.667
4.544	127.312
4.615	111.828
4.615	114.409
4.615	120.430
4.704	127.742
4.704	129.032
4.704	131.183
4.740	117.419
4.757	124.301
4.846	105.806
4.882	129.892
4.935	140.215
4.935	133.333
4.953	131.183
4.970	127.312
4.970	120.000
4.970	117.419
4.970	112.258
4.988	124.301
5.059	138.065
5.077	140.645
5.183	143.656
5.290	142.796
5.290	139.355
5.538	141.505
5.609	119.140
5.627	147.097
5.680	133.763
5.680	136.774
5.680	139.785
5.680	141.075
5.680	142.796
5.680	145.376
5.698	150.538
5.716	147.097
5.751	129.032
5.964	140.215
5.964	114.839
5.982	124.301
6.124	149.677
6.124	147.527
6.302	145.806
6.302	143.226
6.533	153.978
6.533	149.247
6.533	147.097
6.568	156.989
6.657	154.839
6.675	138.065
6.675	141.935
6.692	123.871
6.692	130.323
6.692	144.516
6.692	149.677
6.692	157.849
6.959	137.204
6.976	152.688
6.976	150.108
6.976	147.097
6.976	140.215
7.083	148.387
7.136	154.409
7.136	156.129
7.189	169.892
7.296	148.387
7.491	163.011
7.527	143.656
7.527	145.806
7.527	148.387
7.598	139.355
7.686	148.817
7.686	157.849
7.722	159.570
7.722	162.151
7.722	163.441
7.828	154.839
7.917	151.398
7.935	148.387
7.988	144.516
8.095	156.989
8.095	160.430
8.219	148.817
8.237	153.978
8.556	150.968
8.556	159.140
8.574	170.323
8.645	156.129
8.663	144.516
8.716	153.548
8.716	150.538
8.716	148.817
8.716	165.591
8.769	156.989
8.858	147.527
8.876	159.140
8.947	156.559
8.982	138.495
8.982	158.280
9.533	169.892
9.550	157.419
9.550	160.430
9.550	166.022
9.675	156.129
9.675	159.140
9.692	163.441
9.692	165.591
9.781	150.108
9.976	151.398
10.207	157.419
10.864	152.688
10.970	156.129
11.183	163.011
11.751	161.290
12.053	176.774
12.710	162.581];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'DaveStev1988';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.168	76.522
0.260	67.826
0.279	64.783
0.524	73.478
0.562	66.957
0.571	87.826
0.617	63.913
0.623	90.000
0.703	70.435
0.735	77.826
0.736	75.652
0.793	66.522
0.835	93.478
0.857	83.043
0.859	77.826
0.860	76.957
0.913	76.957
1.103	87.826
1.280	90.870
1.281	87.826
1.282	85.217
1.456	94.348
1.480	80.435
1.579	96.957
1.601	87.826
1.624	74.348
1.638	83.043
1.651	93.478
1.652	92.174
1.653	90.000
1.788	105.217
1.798	83.043
1.809	98.696
1.846	94.348
1.906	80.435
2.222	86.522
2.533	107.391
2.538	95.652
2.543	83.478
2.549	111.304
2.554	99.565
2.571	101.739
2.675	106.522
2.676	104.348
2.677	101.739
2.681	93.478
2.682	90.000
2.776	120.000
2.777	117.391
2.778	113.913
2.827	124.348
2.828	122.174
2.833	110.870
2.834	109.130
2.835	106.087
2.855	101.739
2.856	99.565
2.885	113.913
2.905	109.130
2.925	102.609
2.928	96.957
2.952	122.174
3.063	113.478
3.124	94.348
3.171	109.130
3.252	127.391
3.506	114.348
3.546	104.783
3.564	103.478
3.603	96.522
3.611	116.522
3.663	120.435
3.668	109.565
3.668	108.261
3.701	113.913
3.787	121.304
3.825	115.652
3.884	101.739
3.891	126.087
3.910	124.348
3.911	122.174
3.913	117.826
4.485	107.826
4.489	139.130
4.494	128.261
4.608	110.435
4.670	131.304
4.690	126.522
4.794	132.609
4.795	129.565
4.801	116.522
4.809	136.957
4.810	135.652
4.811	133.913
4.898	137.826
4.900	133.043
4.902	128.261
4.904	123.478
4.910	111.304
4.911	108.696
4.941	121.304
5.274	131.304
5.613	126.087
5.802	140.870
5.821	136.957
5.822	135.217
5.910	137.826
5.928	135.652
5.947	133.913
6.126	130.000
6.851	136.957
6.855	127.826
7.703	136.957
7.931	142.609
8.871	143.913];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'DaveStev1988';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00479 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3QV'; % Cat of Life
metaData.links.id_ITIS = '564515'; % ITIS
metaData.links.id_EoL = '46559807'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_tilstoni'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_tilstoni'; % ADW
metaData.links.id_Taxo = '165449'; % Taxonomicon
metaData.links.id_WoRMS = '271325'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-tilstoni'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_tilstoni}}';
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
bibkey = 'DaveStev1988'; type = 'Article'; bib = [ ... 
'author = {Stephanie Davenport and John D. Stevens}, ' ... 
'year = {1988}, ' ...
'title = {Age and Growth of Two Commercially Important Sharks (\emph{Carcharhinus tilstoni} and \emph{C. sorrah}) from {N}orthern {A}ustralia}, ' ...
'journal = {Aust. J. Mar. Freshwater Res.}, ' ...
'volume = {39}, ' ...
'pages = {417-433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-tilstoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

