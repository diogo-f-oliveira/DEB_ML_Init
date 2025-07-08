function [data, auxData, metaData, txtData, weights] = mydata_Noturus_hildebrandi
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_hildebrandi'; 
metaData.species_en = 'Least madtom'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 07 26]; 

%% set data
% zero-variate data;

data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'MaydWals1984';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.5;  units.Lp  = 'cm';	label.Lp  = 'standard length at puberty';  bibkey.Lp  = 'MaydWals1984';
  comment.Lp = 'Based on SL 4.74 cm, see F2';
data.Li  = 5.2;   units.Li  = 'cm';	label.Li  = 'ultimate standard length';    bibkey.Li  = 'MaydWals1984'; 
  
data.Wwb = 4.68e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MaydWals1984'; 
  comment.Wwb = 'based on egg diameter of 2.1 to 2.3 mm: pi/6*0.23^3';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
-6.317	1.419
30.621	1.951
55.114	3.041
92.810	2.867
116.103	3.236
171.170	3.430
210.477	3.594
235.902	3.816
273.455	3.773
298.912	3.966
358.132	3.969
397.628	3.956
421.095	4.163
458.207	4.533
546.705	4.846];
data.tL(:,1) = 15 + data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaydWals1984';

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
-2.056	0.067
38.520	0.781
64.739	0.330
100.361	0.258
121.760	0.515
182.867	0.588
218.008	0.907
241.697	0.907
279.362	0.779
304.791	0.970
362.197	0.842
401.824	0.725
427.411	0.787
466.108	1.424
552.891	1.487];
data.tWw(:,1) = 15 + data.tWw(:,1);
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(20);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'MaydWals1984';

% length - fecundity
data.LN = [ ... % log standard length (mm), log fecundity (#)
3.539	3.239
3.619	3.529
3.633	3.477
3.640	3.200
3.642	3.465
3.643	3.368
3.644	3.477
3.655	3.361
3.656	2.794
3.662	3.613
3.663	3.374
3.664	4.213
3.665	3.555
3.668	3.497
3.669	3.310
3.671	3.206
3.674	2.845
3.675	3.555
3.677	3.329
3.677	3.677
3.678	3.219
3.678	2.987
3.681	2.774
3.684	3.510
3.685	3.800
3.689	3.690
3.689	3.032
3.690	2.839
3.690	3.548
3.691	3.310
3.697	3.787
3.698	3.523
3.701	3.710
3.704	3.032
3.705	3.561
3.707	3.677
3.707	3.213
3.708	3.606
3.714	2.994
3.715	3.561
3.722	3.800
3.724	3.516
3.725	3.742
3.725	3.174
3.728	3.006
3.730	3.142
3.730	3.697
3.731	3.910
3.732	3.426
3.735	3.748
3.736	3.652
3.736	3.542
3.737	3.471
3.738	3.729
3.740	3.697
3.740	3.142
3.740	3.968
3.741	3.768
3.743	3.226
3.746	3.594
3.747	3.452
3.750	3.839
3.750	3.406
3.752	3.155
3.753	3.865
3.753	3.671
3.754	3.561
3.761	4.116
3.764	3.155
3.764	3.497
3.765	3.735
3.765	3.542
3.767	3.632
3.768	3.690
3.768	3.277
3.768	3.897
3.769	3.226
3.773	3.103
3.775	4.032
3.777	3.639
3.778	3.735
3.779	3.265
3.780	3.684
3.784	3.471
3.787	3.587
3.788	4.084
3.789	3.742
3.789	3.252
3.797	3.181
3.799	3.271
3.801	3.206
3.806	3.116
3.811	3.516
3.819	3.961
3.824	3.819
3.828	3.723
3.830	3.942
3.835	3.729
3.837	3.645
3.840	3.445
3.845	3.394
3.846	3.465
3.852	3.858
3.852	3.394
3.859	3.684
3.863	3.581
3.870	4.213
3.871	3.658
3.886	3.187
3.895	4.026
3.899	3.561
3.901	4.071
3.903	3.961
3.910	3.497
3.910	3.665
3.912	3.600];
data.LN = exp(data.LN); % remove log transform
data.LN(:,1) = data.LN(:,1)/ 10; % convert mm to cm
units.LN   = {'cm', '#'};  label.LN = {'standard length', 'fecundity'};  
temp.LN    = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BakeHein1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL and tWw data varied between 5 and 26 C';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '47ZMV'; % Cat of Life
metaData.links.id_ITIS = '164017'; % ITIS
metaData.links.id_EoL = '216980'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_hildebrandi'; % Wikipedia
metaData.links.id_ADW = 'Noturus_hildebrandi'; % ADW
metaData.links.id_Taxo = '181573'; % Taxonomicon
metaData.links.id_WoRMS = '1524992'; % WoRMS
metaData.links.id_fishbase = 'Noturus-hildebrandi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_hildebrandi}}';
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
bibkey = 'MaydWals1984'; type = 'Article'; bib = [ ... 
'author = {Richard L. Mayden and Stephen J. Walsh},'...
'title = {Life History of the Least Madtom \emph{Noturus hildebrandi} ({S}iluriformes: {I}ctaluridae) with Comparisons to Related Species},'...
'journal = {The American Midland Naturalist},'...
'volume = {112(2)},'...
'year = {1984},'...
'pages = {349-368}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BakeHein1994'; type = 'Article'; bib = [ ... 
'author = {Baker, J. A. and Heins, D. C.},'...
'title = {Reproductive life history of the {N}orth {A}merican madtom catfish, \emph{Noturus hildebrandi} ({B}ailey \& {T}aylor 1950), with a review of data for the genus},'...
'journal = {Ecology of Freshwater Fish},'...
'volume = {3},'...
'year = {1994},'...
'pages = {167-175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-hildebrandi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

