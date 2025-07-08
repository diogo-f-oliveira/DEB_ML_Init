function [data, auxData, metaData, txtData, weights] = mydata_Noturus_munitus
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_munitus'; 
metaData.species_en = 'Fracklebelly madtom'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
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

data.Lp  = 4.1;  units.Lp  = 'cm';	label.Lp  = 'standard length at puberty';  bibkey.Lp  = 'BennKua2010';
  comment.Lp = 'based on observation that SL 4.1 cm had 55 eggs';
data.Li  = 7.7;   units.Li  = 'cm';	label.Li  = 'ultimate standard length';    bibkey.Li  = 'fishbase'; 
  comment.Li = 'based on TL 9.5 cm, see F2';  

data.Wwb = 1.15e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 2.8 mm of N.flavipinnis: pi/6*0.28^3';
data.Wwi  = 6.2;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';

data.Ri  = 30.55/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri  = 'BennKua2010';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
4*30.5  2.00
6*30.5  2.20
16*30.5 4.25
18*30.5 3.2
28*30.5 5.0
30*30.5 4.4
42*30.5 6.50];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BennKua2010';

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
metaData.links.id_CoL = '47ZN4'; % Cat of Life
metaData.links.id_ITIS = '164021'; % ITIS
metaData.links.id_EoL = '208075'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_munitus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_munitus'; % ADW
metaData.links.id_Taxo = '181579'; % Taxonomicon
metaData.links.id_WoRMS = '1013471'; % WoRMS
metaData.links.id_fishbase = 'Noturus-munitus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_munitus}}';
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
bibkey = 'BennKua2010'; type = 'Article'; bib = [ ... 
'doi = {10.1656/058.009.0309}, ' ...
'author = {Bennett, Micah G. and Kuhajda, Bernard R. and Khudamrongsawat, Jenjit},'...
'title = {Life-History Attributes of the Imperiled Frecklebelly Madtom, \emph{Noturus munitus} ({S}iluriformes: {I}ctaluridae), in the {C}ahaba {R}iver {S}ystem, {A}labama},'...
'journal = {Southeastern Naturalist},'...
'volume = {9(3)},'...
'year = {2010},'...
'pages = {507-520}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-munitus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

