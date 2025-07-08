function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_microlepis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_microlepis'; 
metaData.species_en = 'Gag'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 26]; 

%% set data
% zero-variate data
data.am = 11*365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'guess';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Serranus scriba';
  
data.Lp = 58;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 145;   units.Li = 'cm';  label.Li = 'ultimate total length'; bibkey.Li  = 'fishbase'; 

data.Wwb = 1.9e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 0.712 mm of Serranus scriba: pi/6*0.0712^3';   
data.Wwi = 4.27e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.011488*Li^3.04, see F1';

data.Ri = 4.3e6/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... % yr class (yr), standard length at f and T
95.614	6.500
96.850	6.383
97.557	6.384
98.267	7.312
98.911	6.315
99.384	6.815
101.208	6.413
102.446	6.629
102.503	6.273
102.744	7.556
102.914	5.917
103.277	8.128
103.624	6.583
104.033	5.823
104.101	8.034
104.867	8.130
105.096	6.538
105.277	7.679
106.276	7.157
106.334	6.848
106.454	7.538
106.693	8.370
106.747	7.206
106.873	9.155
107.751	7.849
108.401	8.230
108.579	8.658
108.686	5.925
108.993	9.087
109.279	6.924
109.286	8.754
109.996	9.444
110.703	9.469
111.463	8.115
114.884	9.309
115.588	8.716
115.654	10.475
116.588	8.527
116.893	11.023
116.948	10.025
117.535	9.598
117.716	10.573
117.769	9.194
118.781	11.810
119.005	9.172
120.183	9.174
120.241	8.865
120.607	11.837
121.124	8.724
121.253	11.457
121.596	8.962
121.646	6.870
121.959	11.363
123.200	12.268
124.024	12.269
125.783	10.228
128.099	14.818
130.920	13.420
136.930	14.094];  
data.tL(:,2) =  data.tL(:,2)/ 0.92; % convert SL tot TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StreFitz2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
% auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.011488*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphroditic';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'SL = 0.92 * tL, based on photo';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '44ZP7'; % Cat of Life
metaData.links.id_ITIS = '167759'; % ITIS
metaData.links.id_EoL = '46579706'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_microlepis'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_microlepis'; % ADW
metaData.links.id_Taxo = '180508'; % Taxonomicon
metaData.links.id_WoRMS = '273880'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-microlepis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_microlepis}}';
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
bibkey = 'StreFitz2003'; type = 'Article'; bib = [ ... 
'author = {Andrew J. Strelcheck and Gary R. Fitzhugh and Felicia C. Colemana and Christopher C. Koenig}, ' ... 
'year = {2003}, ' ...
'title = {Otolith-fish size relationship in juvenile gag (\emph{Mycteroperca microlepis}) of the eastern {G}ulf of {M}exico: a comparison of growth rates between laboratory and field populations}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {60}, ' ...
'pages = {255-265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Mycteroperca-microlepis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
