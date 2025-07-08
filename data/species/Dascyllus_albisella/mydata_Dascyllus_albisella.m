function [data, auxData, metaData, txtData, weights] = mydata_Dascyllus_albisella

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Dascyllus_albisella'; 
metaData.species_en = 'Hawaiian dascyllus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPh'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(20.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'WinsTayl2017';   
  temp.am = C2K(20.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.1e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Baen2024';
  comment.Wwb = 'based on egg length of 0.7 mm and width 0.5 mm: pi/6*0.07*0.05^2'; 
data.Wwp = 4.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.02089*Lp^2.98, see F1';
data.Wwi = 43.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.98, see F1';

data.Ri  = 52800/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Asoh2003';   
  temp.Ri = C2K(20.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time (yr), standard length (cm)
1.116	7.527
1.993	8.307
2.030	8.127
2.060	7.102
2.072	8.669
3.051	7.882
3.058	8.786
3.091	8.244
3.999	8.060
4.070	7.458
4.154	8.542
6.124	8.536
7.072	8.654
8.096	8.891
10.103	8.825
10.170	7.560
11.120	7.979
13.057	8.696
13.089	7.912
13.892	8.874
16.082	8.024
18.058	8.801
21.082	7.949];
data.tL(:,1) = 365*(data.tL(:,1) + 0); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WinsTayl2017';
comment.tL = 'data from Johnston Atoll';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YHTX'; % Cat of Life
metaData.links.id_ITIS = '170096'; % ITIS
metaData.links.id_EoL = '46572295'; % Ency of Life
metaData.links.id_Wiki = 'Chromis_verater'; % Wikipedia
metaData.links.id_ADW = 'Chromis_verater'; % ADW
metaData.links.id_Taxo = '171095'; % Taxonomicon
metaData.links.id_WoRMS = '273759'; % WoRMS
metaData.links.id_fishbase = 'Chromis-verater'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chromis_verater}}';
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
bibkey = 'WinsTayl2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-017-1559-8}, ' ...
'author = {M. S. Winston and B. M. Taylor and E. C. Franklin}, ' ... 
'year = {2017}, ' ...
'title = {Intraspecific variability in the life histories of endemic coral-reef fishes between photic and mesophotic depths across the {C}entral {P}acific Ocean}, ' ...
'journal = {Coral Reefs}, ' ...
'volume = {36}, ' ...
'pages = {663–674}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Asoh2003'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-003-1108-6}, ' ...
'author = {Asoh, K}, ' ... 
'year = {2017}, ' ...
'title = {Reproductive parameters of female {H}awaiian damselfish \emph{Dascyllus albisella} with comparison to other tropical and subtropical damselfishes}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {143}, ' ...
'pages = {803–810}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chromis-verater.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baen2024'; type = 'Misc'; bib = [ ...
'year = {2024}, ' ...
'author = {Frank Baensch}, ' ... 
'howpublished = {\url{https://www.frankbaensch.com/marine-aquarium-fish-culture/my-research/hawaiian-dascyllus-culture/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];