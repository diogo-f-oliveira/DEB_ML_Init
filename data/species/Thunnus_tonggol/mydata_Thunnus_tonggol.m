function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_tonggol
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_tonggol'; 
metaData.species_en = 'Longtail tuna'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 05 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 02];

%% set data
% zero-variate data

data.am = 19 * 365;   units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 60.7;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 145;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb  = 6.06e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05 mm for Thunnus obesus: pi/6*0.105^3';
data.Wwi  = 43e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate weight';   bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^3.00, see F1; max published weight 35.9 kg';

data.Ri = 1.9e6/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % yr class (yr), fork length 
1.706	48.199
2.309	63.623
2.309	60.318
2.362	64.449
2.493	79.047
2.493	60.869
2.651	68.030
2.651	67.754
3.097	77.394
3.175	84.004
3.202	68.581
3.307	82.076
3.385	80.148
3.412	67.479
3.490	67.203
3.517	68.856
3.595	81.250
3.884	70.784
3.910	71.335
3.936	76.292
3.963	89.237
4.041	68.581
4.304	79.873
4.383	83.453
4.409	71.886
4.488	85.657
4.514	63.623
4.540	72.436
4.566	80.975
4.619	70.508
4.619	67.754
4.619	66.377
4.750	70.233
4.776	80.975
4.776	67.203
4.881	66.377
4.934	84.004
5.144	75.466
5.170	72.712
5.170	77.394
5.170	80.148
5.380	81.525
5.432	87.309
5.432	81.525
5.485	101.631
5.485	71.335
5.590	85.657
5.642	84.004
5.669	78.771
5.826	71.059
5.826	79.322
5.931	72.987
6.036	79.873
6.377	75.191
6.403	77.669
6.482	76.843
6.561	94.470
6.587	70.784
6.666	78.496
6.718	79.873
6.771	81.250
6.823	91.716
6.876	78.496
6.981	112.373
7.033	80.148
7.086	100.805
7.086	76.292
7.138	87.034
7.164	82.352
7.296	80.424
7.532	102.182
7.584	90.339
7.584	72.436
7.768	81.250
7.847	93.093
7.899	84.555
7.899	77.945
7.925	76.292
7.925	66.653
7.952	95.297
7.978	81.250
8.057	79.047
8.083	94.195
8.135	93.919
8.319	95.297
8.398	96.674
8.424	76.017
8.503	80.424
8.660	74.089
8.713	94.746
8.870	79.873
8.896	77.119
9.133	81.801
9.474	103.008
9.474	84.004
9.579	109.619
9.841	111.822
9.946	91.716
9.999	106.314
10.891	89.237
10.943	97.225
11.311	86.483
11.704	107.415
11.731	95.847
11.862	108.242
11.993	107.415
13.279	88.962
15.930	108.792
17.662	107.966];
data.tL_f(:,1) = 365 * (0.6 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(26.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GrifFry2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), fork length           
0.394	23.686
1.548	52.331
1.863	57.288
2.362	58.665
2.388	59.492
2.414	61.695
2.519	60.318
2.546	63.623
2.572	67.479
2.651	61.144
2.703	70.233
2.729	71.335
2.756	65.826
3.070	79.047
3.123	68.305
3.228	74.364
3.359	61.695
3.359	76.568
3.385	73.263
3.385	82.352
3.490	59.767
3.490	80.699
3.490	83.178
3.543	92.818
3.543	66.377
3.543	70.233
3.543	74.915
3.569	77.669
3.595	64.174
3.622	66.653
3.674	61.695
3.727	69.407
3.727	71.610
3.727	75.466
3.753	84.004
3.779	82.076
3.858	76.292
3.910	67.203
3.936	71.059
4.015	68.581
4.041	82.903
4.068	81.250
4.068	86.208
4.199	77.119
4.409	62.246
4.435	92.267
4.435	84.280
4.461	82.903
4.488	65.826
4.514	85.381
4.540	88.411
4.540	79.047
4.540	78.496
4.540	72.436
4.566	67.203
4.593	74.640
4.593	70.508
4.593	69.131
4.593	62.246
4.645	76.017
4.724	78.496
4.724	72.987
4.776	76.568
4.802	91.165
4.829	79.873
4.855	96.674
4.855	77.119
4.855	69.958
4.881	68.305
4.907	87.309
5.039	74.640
5.039	74.640
5.039	72.161
5.065	68.305
5.249	62.521
5.380	72.987
5.432	81.801
5.459	61.970
5.485	77.119
5.537	64.174
5.537	71.059
5.564	68.856
5.590	74.640
5.616	82.903
5.642	75.466
5.747	77.945
5.747	91.716
5.747	80.975
5.800	88.962
5.852	66.377
5.852	83.729
5.878	73.814
5.878	81.525
5.905	79.597
5.905	76.292
5.905	74.640
5.931	88.962
5.931	86.483
5.957	77.119
6.010	93.644
6.062	90.339
6.062	82.352
6.062	80.699
6.167	84.555
6.193	70.784
6.298	86.483
6.298	87.585
6.351	83.729
6.403	104.936
6.430	90.614
6.456	85.106
6.482	106.038
6.482	74.640
6.482	76.292
6.482	77.669
6.508	100.254
6.561	89.237
6.640	81.250
6.692	68.856
6.718	83.453
6.744	88.962
6.849	68.856
6.849	85.932
6.876	78.496
6.954	94.746
6.981	90.614
7.059	86.483
7.269	93.644
7.427	82.352
7.453	84.280
7.506	80.424
7.506	78.496
7.532	85.657
7.689	80.148
7.899	91.165
7.978	115.127
7.978	77.394
8.030	105.487
8.083	103.835
8.188	88.411
8.345	101.081
8.398	91.441
8.424	82.076
8.477	87.860
8.555	85.657
8.634	104.936
8.686	77.945
8.765	78.496
8.818	82.352
8.870	85.657
9.001	92.818
9.500	82.076
9.552	94.195
9.762	85.106
9.815	103.835
9.946	85.106
10.025	103.284
10.419	106.589
10.497	105.763
10.812	116.504
10.943	107.966
11.022	110.996
11.022	91.165
12.807	109.894
12.859	114.852
13.069	117.606
13.778	105.487
13.988	124.767
18.659	112.648];
data.tL_m(:,1) = 365 * (0.6 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(26.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GrifFry2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts 
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56P7R'; % Cat of Life
metaData.links.id_ITIS = '172479'; % ITIS
metaData.links.id_EoL = '46577339'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_tonggol'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_tonggol'; % ADW
metaData.links.id_Taxo = '189038'; % Taxonomicon
metaData.links.id_WoRMS = '219722'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-tonggol'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_tonggol}}';
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
bibkey = 'GrifFry2010'; type = 'Article'; bib = [ ... 
'author = {Shane P. Griffiths and Gary C. Fry and Fiona J. Manson and Dong C. Lou}, ' ... 
'year = {2010}, ' ...
'title = {Age and growth of longtail tuna (\emph{Thunnus tonggol}) in tropical and temperate waters of the central {I}ndo-{P}acific}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {67}, ' ...
'pages = {125–134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Thunnus-tonggol.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

