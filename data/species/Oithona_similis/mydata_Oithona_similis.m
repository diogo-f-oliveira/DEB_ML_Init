function [data, auxData, metaData, txtData, weights] = mydata_Oithona_similis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Cyclopoida'; 
metaData.family     = 'Oithonidae';
metaData.species    = 'Oithona_similis'; 
metaData.species_en = 'Copepod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp','biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'WCb'; 'WCp'; 'WCi'; 'Ri'}; 
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 01 31]; 

%% set data
% zero-variate data

data.tp = 20;        units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'SabaKior1994';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 45;        units.am = 'd';      label.am = 'life span';                bibkey.am = 'SabaKior1994';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9.7e-8;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'SabaKior1994';
  comment.Wwb = 'based on egg diameter of 57 mum: pi/6*0.0057^3';
data.WCb = 18;    units.WCb = 'ng';   label.WCb = 'C-weight at birth';     bibkey.WCb = 'SabaKior1994';
data.WCp = 550;   units.WCp = 'ng';   label.WCp = 'C-weight at puberty';   bibkey.WCp = 'SabaKior1994';
data.WCi = 550;   units.WCi = 'ng';   label.WCi = 'ultimate C-weight';     bibkey.WCi = 'SabaKior1994';

data.Ri  = 2.5;    units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'SabaKior1994';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '37.4 eggs per female over 23.8 d at optimal food'; 

% uni-variate data

% tW-data, 
data.tW1 = [  ... % time since birth (h), C-weight (ng)
 98.414	29.683
142.056	37.060
178.838	50.028
217.377	68.855
285.492	100.345
355.405	155.013
355.605	186.469
406.222	239.641
455.178	329.690
469.486	486.182
478.292	546.174]; 
data.tW1(:,1) = data.tW1(:,1)/ 24; % convert h to d
units.tW1   = {'d', 'ng'};  label.tW1 = {'time since birth', 'C-weight'};  
temp.tW1    = C2K(15);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'SabaKior1994';
% 
data.tW1 = [  ... % time since birth (h), C-weight (ng)
 98.414	29.683
142.056	37.060
178.838	50.028
217.377	68.855
285.492	100.345
355.405	155.013
355.605	186.469
406.222	239.641
455.178	329.690
469.486	486.182
478.292	546.174]; 
data.tW1(:,1) = data.tW1(:,1)/ 24; % convert h to d
units.tW1   = {'d', 'ng'};  label.tW1 = {'time since birth', 'C-weight'};  
temp.tW1    = C2K(15);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'SabaKior1994';
%
data.tW2 = [  ... % time since birth (h), C-weight (ng)
46.112	23.372
93.246	29.722
145.431	32.658
175.404	50.010
190.037	99.666
237.129	121.912
284.232	150.580
308.935	217.585
359.720	326.381
379.099	423.901
433.051	479.514
478.229	497.222]; 
data.tW2(:,1) = data.tW2(:,1)/ 24; % convert h to d
units.tW2   = {'d', 'ng'};  label.tW2 = {'time since birth', 'C-weight'};  
temp.tW2    = C2K(15);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'SabaKior1994';
%
data.tW3 = [  ... % time since birth (h), C-weight (ng)
38.070	25.013
51.912	23.595
119.535	56.615
190.011	92.066
218.454	130.660
283.072	144.005
283.356	171.553
313.526	241.111
330.837	225.244
355.874	335.592
383.907	369.867
410.276	427.953
410.371	453.666
429.519	449.276
459.483	556.451]; 
data.tW3(:,1) = data.tW3(:,1)/ 24; % convert h to d
units.tW3   = {'d', 'ng'};  label.tW3 = {'time since birth', 'C-weight'};  
temp.tW3    = C2K(15);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'SabaKior1994';
%
data.tW4 = [  ... % time since birth (h), C-weight (ng)
47.954	22.931
100.548	39.410
144.507	67.108
189.736	86.186
197.085	114.217
240.497	138.388
244.195	161.651
284.331	218.015
334.436	232.692
378.598	449.627
383.332	342.355
431.853	398.861
435.567	470.463
480.672	558.989]; 
data.tW4(:,1) = data.tW4(:,1)/ 24; % convert h to d
units.tW4   = {'d', 'ng'};  label.tW4 = {'time since birth', 'C-weight'};  
temp.tW4    = C2K(15);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'SabaKior1994';

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

%% Group plots
set1 = {'tW1','tW2','tW3','tW4'}; subtitle1 = {'Cohort 1,2,3,4'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Acceleration starts at birth and continues till puberty, beyond metam; growth ceases at puberty';
D2 = 'Data for females';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'sexual reproduction in last copepodite stage; 6 naupliar stages, 6 copepodite stages';
metaData.bibkey.F1 = 'SabaKior1994'; 
F2 = 'Nauplius 1 is already feeding';
metaData.bibkey.F2 = 'SabaKior1994'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '49262'; % Cat of Life
metaData.links.id_ITIS = '88805'; % ITIS
metaData.links.id_EoL = '46535154'; % Ency of Life
metaData.links.id_Wiki = 'Oithona'; % Wikipedia
metaData.links.id_ADW = 'Oithona_similis'; % ADW
metaData.links.id_Taxo = '33598'; % Taxonomicon
metaData.links.id_WoRMS = '106656'; % WoRMS


%% References
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
bibkey = 'SabaKior1994'; type = 'Article'; bib = [ ... 
'author = {Sabatini, Marina and Ki{\o}rboe, T.}, ' ... 
'year = {1994}, ' ...
'title = {Egg production, growth and development of the cyclopoid copepod \emp{Oithona similis}}, ' ...
'journal = {J. Plankton Res.}, ' ...
'volume = {16}, ' ...
'pages = {1329-1351}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaizCalb2017'; type = 'Article'; bib = [ ... 
'author = {Saiz, E. and Calbet, A. and Griffell, K.}, ' ... 
'year = {2017}, ' ...
'title = {Sex-Dependent Effects of Caloric Restriction on the Ageing of an Ambush Feeding Copepod}, ' ...
'journal = {Scientific REPOrts}, ' ...
'doi = {10.1038/s41598-017-12661-4}, ' ...
'volume = {7}, ' ...
'pages = {12662}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
