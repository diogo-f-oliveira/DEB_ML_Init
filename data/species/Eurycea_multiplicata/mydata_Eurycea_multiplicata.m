function [data, auxData, metaData, txtData, weights] = mydata_Eurycea_multiplicata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Eurycea_multiplicata'; 
metaData.species_en = 'Many-ribbed salamander'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'tL_fT','L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 12];

%% set data
% zero-variate data

data.ab = 30;       units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'Irel1976';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9.1*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'guess';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Eurycea lucifuga';

data.Lb  = 0.95;       units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Irel1976';
data.Lj  = 3.3;       units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'Irel1976';
data.Lp  = 3.4;        units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'Irel1976'; 
data.Li  = 4.2;         units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'amphibiaweb';
  comment.Li = 'TL = 7.8 cm based on F1';

data.Wwi = 2.0;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Eurycea lucifuga: 2.6*(4.2/4.56)^3';

% univariate data
data.tL_T = [ ... % time since birth (d), SVL (cm)
0.000	1.139
32.182	1.310
61.856	1.195
94.106	1.839
123.247	2.325
152.167	2.230
182.157	2.942
213.546	3.330
244.189	3.757
273.259	4.055
302.172	3.940
332.822	4.387
362.613	4.577
391.667	4.837
422.126	4.781];
units.tL_T  = {'d', 'cm'};  label.tL_T = {'time since birth', 'SVL', 'Trout farm'};  
temp.tL_T   = 'varying between 14.8 and 16.0 C';  units.temp.tL_T = 'K'; label.temp.tL_T = 'temperature';
bibkey.tL_T = 'Irel1976'; comment.tL_T = 'Data from Trout farm, NW of Johnson City, Washington County, Arkansa, northwest Arkansas';
%
data.tL_L = [ ... % time since birth (d), SVL (cm)
0.000	1.167
29.843	1.340
61.981	1.513
92.589	1.906
120.901	2.208
152.275	2.670
183.648	3.272
213.491	3.515
244.864	3.698
275.472	4.330
305.314	4.433
334.392	4.506];
units.tL_L  = {'d', 'cm'};  label.tL_L = {'time since birth', 'SVL', 'Lost Valley'};  
temp.tL_L   = 'varying between 14.0 and 18.9 C';  units.temp.tL_L = 'K'; label.temp.tL_L = 'temperature';
bibkey.tL_L = 'Irel1976'; comment.tL_L = 'Data from Lost Valley, northwest Arkansas';
%
data.tL_B = [ ... % time since birth (d), SVL (cm)
1.899	1.104
32.950	1.221
63.171	1.696
92.416	1.893
124.605	2.993
154.011	3.895
187.929	4.579];
units.tL_B  = {'d', 'cm'};  label.tL_B = {'time since birth', 'SVL', 'Black Oak area'};  
temp.tL_B   = 'varying between 0 and 21 C';  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'Irel1976'; comment.tL_B = 'Data from Black Oak area, northwest Arkansas';

% length-fecundity
data.LN = [ ... % SVL (cm), fecundity (#)
3.031	6.463
3.038	8.166
3.041	11.623
3.092	4.810
3.192	7.916
3.194	9.920
3.206	11.523
3.292	10.020
3.295	6.814
3.296	7.966
3.301	14.429
3.302	9.068
3.367	6.814
3.390	2.906
3.399	7.916
3.403	13.026
3.454	11.473
3.499	9.820
3.500	5.561
3.508	14.930
3.595	13.477
3.606	8.918
3.609	12.475
3.614	11.423
3.660	11.924
3.666	5.812
3.710	9.970
3.747	16.583
3.748	4.910
3.754	12.625
3.755	13.627
3.755	7.966
3.756	15.030
3.758	11.473
3.772	15.681
3.804	16.533
3.862	12.425
3.899	13.577
3.921	15.230
3.954	5.010
3.999	3.006
4.000	10.020
4.002	12.475
4.120	17.585
4.158	13.978
4.201	16.032
4.301	6.012
4.301	12.525
4.308	14.178
4.314	15.030
4.357	17.685
4.417	14.980
4.420	19.238
4.498	13.377
4.500	16.032
4.501	10.020
4.651	16.934
4.694	12.475
4.705	20.190
4.707	10.070
4.752	14.679
4.761	18.838
4.769	16.032
4.770	17.084
4.856	15.882
4.915	17.986
5.008	4.960
5.011	15.030
5.253	14.880
5.265	17.084
5.267	18.587
5.267	12.525
5.309	19.589
5.357	14.930
5.363	17.034
5.516	20.090
5.517	21.844
5.611	4.008
5.712	20.040
5.721	18.086
5.724	15.982
5.825	19.439];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'fecundity'};  
temp.LN   = 15;  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Irel1976'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_T = weights.tL_T * 5;
weights.tL_L = weights.tL_L * 5;
weights.tL_B = weights.tL_B * 5;
weights.Li = weights.Li * 3;
weights.Lb = weights.Lb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_T','tL_L','tL_B'}; subtitle1 = {'Data from Trout farm, LostValley', 'Black Oak'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as: 15+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'SVL = TL * 0.54, based on photo';
metaData.bibkey.F1 = 'flickr'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6HF6L'; % Cat of Life
metaData.links.id_ITIS = '173692'; % ITIS
metaData.links.id_EoL = '331264'; % Ency of Life
metaData.links.id_Wiki = 'Eurycea_multiplicata'; % Wikipedia
metaData.links.id_ADW = 'Eurycea_multiplicata'; % ADW
metaData.links.id_Taxo = '47415'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Eurycea+multiplicata'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eurycea_multiplicata}}';
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
bibkey = 'Irel1976'; type = 'Article'; bib = [ ... 
'author = {Patrick H. Ireland}, ' ... 
'year = {1976}, ' ...
'title = {Reproduction and Larval Development of the Gray-Bellied Salamander \emph{Eurycea multiplicata griseogaster}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {32(3)}, ' ...
'pages = {233-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Eurycea+multiplicata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/331264/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flickr'; type = 'Misc'; bib = ...
'howpublished = {\url{https://live.staticflickr.com/5320/14330112993_b042210203_z.jpg}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

