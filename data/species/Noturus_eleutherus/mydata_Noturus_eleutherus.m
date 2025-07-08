function [data, auxData, metaData, txtData, weights] = mydata_Noturus_eleutherus
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_eleutherus'; 
metaData.species_en = 'Mountain madtom'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'}; 

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

data.am = 4.5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'StarStar1985';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;  units.Lp  = 'cm';	label.Lp  = 'standard length at puberty';  bibkey.Lp  = 'StarStar1985';
  comment.Lp = 'based on observation that SL 4.1 cm had 55 eggs';
data.Li  = 10.5;   units.Li  = 'cm';	label.Li  = 'ultimate standard length';    bibkey.Li  = 'fishbase'; 
  comment.Li = 'based on TL 13 cm, see F2';  

data.Wwb = 1.15e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 2.8 mm of N.flavipinnis: pi/6*0.28^3';
data.Wwi  = 16.3;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';

data.R41  = 55/365; units.R41  = '#/d'; label.R41  = 'reprod rate at SL 41 mm'; bibkey.R41  = 'StarStar1985';   
  temp.R41 = C2K(20); units.temp.R41 = 'K'; label.temp.R41 = 'temperature';
data.R59  = 155/365; units.R59  = '#/d'; label.R59  = 'reprod rate at SL 59 mm'; bibkey.R59  = 'StarStar1985';   
  temp.R59 = C2K(20); units.temp.R59 = 'K'; label.temp.R59 = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
0 2.25
1 3.10
2 3.90
3 5.1];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StarStar1985';

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

%% Facts
F1 = 'length-weight: W in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length fro photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZMH'; % Cat of Life
metaData.links.id_ITIS = '164009'; % ITIS
metaData.links.id_EoL = '208014'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_eleutherus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_eleutherus'; % ADW
metaData.links.id_Taxo = '181564'; % Taxonomicon
metaData.links.id_WoRMS = '1020184'; % WoRMS
metaData.links.id_fishbase = 'Noturus-eleutherus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_eleutherus}}';
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
bibkey = 'StarStar1985'; type = 'Article'; bib = [ ... 
'author = {Lynn B. Starnes and Wayne C. Starnes},'...
'title = {Ecology and Life History of the Mountain Madtom, Noturus eleutherus (Pisces: Ictaluridae)},'...
'journal = {The American Midland Naturalist},'...
'volume = {114},'...
'year = {1985},'...
'pages = {331-341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-eleutherus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

