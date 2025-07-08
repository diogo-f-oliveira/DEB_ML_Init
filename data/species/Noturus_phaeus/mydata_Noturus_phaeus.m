function [data, auxData, metaData, txtData, weights] = mydata_Noturus_phaeus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_phaeus'; 
metaData.species_en = 'Brown madtom'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 18]; 

%% set data
% zero-variate data;

data.ab = 8.5;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'SimoWall2003';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'ChanPars2000';
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'SimoWall2003';
data.Li  = 15;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = {'fishbase','ChanPars2000'}; 
  
data.Wwb = 8.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SimoWall2003'; 
  comment.Wwb = 'based on egg diameter of 2.1 to 2.8 mm: pi/6*0.25^3';
data.Wwp = 3.6; units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'SimoWall2003','fishbase'};
  comment.Wwp = 'based on 0.00575*Lp^3.10, see F1';
data.Wwi = 25.4; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';

data.Ri = 128/365;	units.Ri  = '#/d';    label.Ri  = 'maximum reprod rate';	bibkey.Ri  = 'SimoWall2003';   
temp.Ri = C2K(16);      units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity 108 to 128 eggs';
 
% uni-variate data
% time-length
data.tL = [ ... % year class (yr), standard length (cm)
0.014	3.119
0.988	5.563
2.003	7.061
2.994	9.085
4.002	10.513
5.003	11.067
5.989	11.621];
data.tL(:,1) = (0.6 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = 0.48 + 1.18 * data.tL(:,2); % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChanPars2000';
comment.tL = 'data from length frequencies; temperature: 8 to 24 C; SL to TL conversion based on F2';

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

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: TL = 0.48+1.18*SL';
metaData.bibkey.F2 = 'ChanPars2000'; 
F3 = 'males and females don''t differ in growth, but no females found exceeding 3 yrs of age';
metaData.bibkey.F3 = 'ChanPars2000'; 
F4 = 'male guards nest';
metaData.bibkey.F4 = 'SimoWall2003'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '47ZN6'; % Cat of Life
metaData.links.id_ITIS = '164022'; % ITIS
metaData.links.id_EoL = '208077'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_phaeus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_phaeus'; % ADW
metaData.links.id_Taxo = '181581'; % Taxonomicon
metaData.links.id_WoRMS = '1383626'; % WoRMS
metaData.links.id_fishbase = 'Noturus-phaeus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_phaeus}},'...
'note = {Accessed : 2017-04-15}'];
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
bibkey = 'ChanPars2000'; type = 'Article'; bib = [ ... 
'author = {Matthew D. Chan and Glenn R. Parsons},'...
'title = {Aspects of Brown Madtom, \emph{Noturus phaeus}, Life History in Northern {M}ississippi},'...
'journal = {Copeia},'...
'volume = {2000(3)},'...
'year = {2000},'...
'pages = {757-762}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SimoWall2003'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Thomas P. Simon and Robert Wallus}, ' ...
'year = {2003}, ' ...
'title  = {Reproductive Biology and Early Life History of Fishes in the Ohio ..., Volume 3}, ' ...
'publisher = {CRC Press}, ' ...
'volume = {3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-phaeus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
