function [data, auxData, metaData, txtData, weights] = mydata_Chelidonichthys_lucerna

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Chelidonichthys_lucerna'; 
metaData.species_en = 'Tub gurnard'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.5); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 09]; 


%% set data
% zero-variate data

data.ah = 115/24;  units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'DulcGrub2001';   
  temp.ah = C2K(13.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'DulcGrub2001';   
  temp.ab = C2K(13.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15 * 365;     units.am = 'd';      label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(13.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.136; units.L0  = 'cm';  label.L0  = 'egg diameter';             bibkey.Lb  = 'DulcGrub2001';  
data.Lh  = 0.309;  units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'DulcGrub2001';  
data.Lb  = 0.485;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'DulcGrub2001';  
data.Lp  = 19.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'IsmeIsme2004'; 
data.Lp_m  = 17.6; units.Lp_m = 'cm'; label.Lp_m = 'total length at puberty for male';  bibkey.Lp_m  = 'IsmeIsme2004'; 
data.Li  = 61;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwi = 6000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
 
% uni-variate data
% time-length
data.tL = [ ... time since birth (yr), total length (cm): mean male, female pooled
1 13.2
2 19.6
3 24.6
4 30.3];
data.tL(:,1) = 365  * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'lotal length'};  
temp.tL    = C2K(13.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IsmeIsme2004';
subtitle.tL = 'mean male, female pooled';
%
% length-fecundity
data.LN = [ ... % total length (cm), fecundity (number of eggs)
15.475	19620.253
16.382	18987.342
16.961	22151.899
17.288	22151.899
17.957	43670.886
18.566	34177.215
18.685	25949.367
18.685	22151.899
19.279	44936.709
19.770	46835.443
19.993	67088.608
20.483	50632.911
20.706	66455.696
20.988	77848.101
20.988	81012.658
21.285	69620.253
21.389	115822.785
21.999	110759.494
21.999	89873.418
22.979	140506.329
23.990	144936.709
23.900	205063.291];
units.LN   = {'cm', '#'};  label.LN = {'lotal length', 'fecundity'};  
temp.LN    = C2K(13.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'IsmeIsme2004';

% length-weight
data.LW_f = [ ... % total legnth (cm), wet weight (g)
7.919	4.075
8.514	4.101
8.946	8.068
9.216	8.080
9.865	6.792
9.919	12.058
10.297	8.127
10.297	10.759
10.459	16.029
10.838	8.151
10.838	12.098
11.000	17.368
11.216	5.536
11.541	9.497
11.541	14.761
11.486	20.021
12.622	13.492
12.622	18.755
12.676	22.705
13.216	5.623
13.216	14.834
13.216	18.781
13.378	26.683
13.649	21.432
14.189	24.087
13.865	29.336
14.459	30.678
14.730	33.321
15.054	34.651
15.108	29.391
15.432	26.773
15.432	33.352
15.757	34.682
15.973	37.323
16.351	36.024
16.297	42.601
16.622	39.983
16.730	45.251
16.892	53.153
17.054	53.160
17.108	42.636
17.486	43.969
17.811	45.299
17.919	51.882
17.919	61.093
18.730	53.234
18.622	63.755
18.459	67.696
18.730	72.971
19.162	65.095
19.270	65.100
19.270	71.678
19.324	76.944
19.865	65.126
20.081	73.030
19.973	80.920
19.973	90.130
20.351	75.673
20.784	77.008
21.162	88.867
21.541	91.515
22.027	116.536
23.973	141.622
23.919	146.882
25.378	161.420
25.378	198.262
30.243	318.212];
units.LW_f = {'cm', 'g'};     label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'IsmeIsme2004';
comment.LW_f = 'Data for females';
% males
data.LW_m = [ ... % total length (cm), wet weight (g)
8.287	6.245
8.619	6.256
9.050	6.269
9.283	7.694
9.383	7.697
10.146	9.611
10.379	10.091
10.445	10.093
10.712	12.936
10.777	10.103
10.977	12.944
11.009	10.111
11.176	11.061
11.309	12.482
11.310	15.789
11.608	15.799
11.642	18.162
11.707	12.495
11.940	14.392
11.907	16.753
11.975	20.062
12.271	12.512
12.272	15.347
12.206	16.762
12.439	18.659
12.705	21.975
12.704	16.778
12.537	12.993
12.936	15.368
13.103	20.098
13.203	22.936
13.336	24.357
13.470	27.196
13.800	22.482
13.601	19.641
13.468	18.692
13.968	26.739
14.002	29.575
14.234	29.582
14.465	27.227
14.930	25.825
13.668	23.423
15.030	29.135
15.329	29.144
14.732	30.543
14.567	34.317
14.563	20.616
15.264	34.339
15.497	36.709
15.662	34.824
15.862	36.720
16.028	38.615
15.961	33.416
15.993	30.110
16.493	40.047
16.627	41.469
16.495	44.299
16.394	40.989
16.559	36.742
16.724	33.913
16.892	41.949
16.993	46.677
16.761	49.504
17.259	47.630
17.524	48.583
17.525	50.946
17.393	52.359
18.323	57.113
18.192	60.888
18.359	65.145
18.492	68.456
18.889	63.272
19.189	65.644
19.023	67.056
19.023	68.946
19.489	71.322
19.924	85.982
21.253	90.276
21.120	91.689
20.991	103.968];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'IsmeIsme2004';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '69QWD'; % Cat of Life
metaData.links.id_ITIS = '643890'; % ITIS
metaData.links.id_EoL = '46568651'; % Ency of Life
metaData.links.id_Wiki = 'Chelidonichthys_lucerna'; % Wikipedia
metaData.links.id_ADW = 'Chelidonichthys_lucerna'; % ADW
metaData.links.id_Taxo = '170737'; % Taxonomicon
metaData.links.id_WoRMS = '127262'; % WoRMS
metaData.links.id_fishbase = 'Chelidonichthys-lucerna'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelidonichthys_lucerna}}';
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
bibkey = 'IsmeIsme2004'; type = 'Article'; bib = [ ... 
'author = {A. Ismen and P. Ismen}, ' ... 
'year = {2004}, ' ...
'title = {Age, Growth and Reproduction of Tub Gurnard (\emph{Chelidonichthys lucerna} {L}. 1758)}, ' ...
'journal = {Turk J. Vet. Anim. Sci.}, ' ...
'volume = {28}, ' ...
'pages = {289--295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DulcGrub2001'; type = 'Article'; bib = [ ... 
'author = {Dulcic, J. and Grubisic, L. and Katavic, I. and Skakelja, N.}, ' ... 
'year = {2001}, ' ...
'title = {Embryonic and larval development of the tub gurnard \emph{Trigle Lucerna} ({P}isces: {T}riglidae).}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {81}, ' ...
'pages = {313--316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1366 *fishbase}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

