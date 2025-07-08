  function [data, auxData, metaData, txtData, weights] = mydata_Hypomesus_nipponensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Hypomesus_nipponensis'; 
metaData.species_en = 'Wakasagi';

metaData.ecoCode.climate = {'MC','Dfb'};
metaData.ecoCode.ecozone = {'MPNW','TH'};
metaData.ecoCode.habitat = {'0jFr', '0jFl', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 11]; 

%% set data
% zero-variate data
data.am = 365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'KudoMizu2000';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 17;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm for Osmerus mordax: pi/6*0.075^3';
data.Wwp = 1.44;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.16, see F1';
data.Wwi = 30;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.16, see F1';

data.Ri = 43779/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri= 'temps are guessed';
    
% uni-variate data

% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	0.514
0.017	0.514
0.028	0.630
0.068	0.887
0.103	0.770
0.129	1.097
0.245	3.432
0.255	3.875
0.260	4.202
0.264	3.035
0.273	3.665
0.275	4.903
0.278	4.062
0.279	4.482
0.283	5.183
0.293	4.436
0.295	4.949
0.301	5.533
0.308	4.039
0.314	6.047
0.321	5.230
0.334	5.790
0.349	5.603
0.360	5.813
0.361	6.280
0.362	6.444
0.369	5.440
0.371	6.840
0.391	5.673
0.395	6.093
0.397	6.911
0.401	6.537
0.434	6.677
0.436	6.747
0.476	7.261
0.477	7.447
0.478	6.117
0.479	6.374
0.482	7.004
0.519	6.864
0.554	7.868
0.561	7.004
0.562	8.078
0.565	8.872
0.587	8.708
0.628	9.525
0.637	9.268
0.638	9.875
0.646	9.619
0.708	10.296
0.709	10.529
0.733	10.436
0.742	10.856
0.775	10.926
0.782	10.599
0.812	10.786
0.884	10.809
0.900	10.949
0.917	11.486
0.919	10.646
0.928	11.066
0.943	11.440
0.946	10.716
0.954	11.230
1.000	10.459];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d; origin is 1 May 
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'KudoMizu2000'};
%
data.tL1 = [ ... % time since birth (yr), total length (cm)
0.000	0.420
0.103	0.374
0.123	0.654
0.247	2.778
0.260	2.872
0.271	2.942
0.275	3.432
0.284	3.082
0.285	3.198
0.292	3.852
0.306	4.132
0.312	4.272
0.321	4.436
0.325	3.852
0.330	4.249
0.334	4.739
0.343	4.506
0.352	4.739
0.358	4.412
0.360	4.879
0.365	4.296
0.375	4.879
0.378	5.019
0.391	4.506
0.397	5.043
0.399	5.206
0.430	5.183
0.476	4.809
0.477	5.556
0.485	4.599
0.502	5.393
0.522	5.043
0.557	5.160
0.558	5.813
0.568	5.953
0.576	6.887
0.587	6.374
0.631	6.817
0.635	7.027
0.636	6.677
0.638	7.261
0.714	7.868
0.719	7.564
0.734	7.681
0.743	8.311
0.773	8.148
0.784	8.218
0.806	8.288
0.894	8.335
0.910	8.405
0.911	8.685
0.912	9.035
0.917	8.218
0.926	8.545
0.930	8.848
0.937	8.241
0.938	8.428
0.944	8.661
0.946	8.965
0.955	8.451
0.959	8.825
1.000	8.428];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d; origin is 1 May 
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length'};  
temp.tL1 = C2K(12); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = {'KudoMizu2000'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for 2 varying food levels'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperature (in C) in tL data is assumed to vary as T(t in d) = 12+8*sin(2*pi*(t-40)/365); t=0 at 1 May';
D2 = 'Scaled functional response in tL data is assumed to alternate between high winter and low summer levels';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Probably semelparous';
metaData.bibkey.F2 = 'KudoMizu2000'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '3NXD8'; % Cat of Life
metaData.links.id_ITIS = '162033'; % ITIS
metaData.links.id_EoL = '46563012'; % Ency of Life
metaData.links.id_Wiki = 'Hypomesus_nipponensis'; % Wikipedia
metaData.links.id_ADW = 'Hypomesus_nipponensis'; % ADW
metaData.links.id_Taxo = '177137'; % Taxonomicon
metaData.links.id_WoRMS = '279421'; % WoRMS
metaData.links.id_fishbase = 'Hypomesus-nipponensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hypomesus_nipponensis}}';  
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
bibkey = 'KudoMizu2000'; type = 'Article'; bib = [ ...  
'author = {Takafumi Kudo and Kenya Mizuguchi}, ' ...
'year = {2000}, ' ...
'title = {Growth of large and small forms of pond smelt \emph{Hypomesus nipponensis} in {L}ake {K}asumigaura, {J}apan}, ' ... 
'publisher = {Royal Irish Academy}, ' ...
'journal = {Threatened Irish Freshwater Fishes}, ' ...
'volume = {104B(3)}, '...
'pages = {57--66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hypomesus-nipponensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
