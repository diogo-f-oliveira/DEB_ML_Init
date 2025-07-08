function [data, auxData, metaData, txtData, weights] = mydata_Beryx_splendens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beryciformes'; 
metaData.family     = 'Berycidae';
metaData.species    = 'Beryx_splendens'; 
metaData.species_en = 'Splendid alfonsino'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 16]; 

%% set data
% zero-variate data

data.am = 23*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 33.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LeisCars2000';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwi = 4000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Length-weight of F1 gives 7.2 kg for 70 cm';

data.Ri = 675e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(10);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  
% univariate data
data.tLA = [ ... % yr class (yr), fork length (cm), 
 0 18.5 
 1 20.7 
 2 24.3 
 3 27.0 
 4 30.6 
 5 32.4 
 6 32.8 
 7 35.2 
 8 36.9 
 9 35.2 
10 37.5 
11 40.5];
data.tLA(:,1) = 365 * (data.tLA(:,1) + 0.75); % convert yr class to time since birth (d)
data.tLA(:,2) = 1.12 * data.tLA(:,2); % convert fork length to total length
units.tLA  = {'d', 'cm'};  label.tLA = {'time since birth', 'total length', 'Azores'};  
temp.tLA   = C2K(10);  units.temp.tLA = 'K'; label.temp.tLA = 'temperature';
bibkey.tLA = 'RicoLore2001';
comment.tLA = 'Data from Azores';
%
data.tLM = [ ... % yr class (yr), fork length (cm),
  0 17.2 
  1 19.7 
  2 21.6
  3 24.3 
  4 26.5 
  5 27.9 
  6 29.6 
  7 31.3 
  8 33.5 
  9 34.5 
 10 33.5 
 11 37.5 
 12 40.5];
data.tLM(:,1) = 365 * (data.tLM(:,1) + 0.75); % convert yr class to time since birth (d)
data.tLM(:,2) = 1.12 * data.tLM(:,2); % convert fork length to total length
units.tLM  = {'d', 'cm'};  label.tLM = {'time since birth', 'total length', 'Madeira'};  
temp.tLM   = C2K(10);  units.temp.tLM = 'K'; label.temp.tLM = 'temperature';
bibkey.tLM = 'RicoLore2001';
comment.tLM = 'Data from Madeira';
%
data.tLC = [ ... % yr class (yr), fork length (cm),
    1 19.5 
    2 25.0 
    3 27.4 
    4 30.1 
    5 31.6 
    6 33.6 
    7 35.3 
    8 36.5 
    9 36.3];
data.tLC(:,1) = 365 * (data.tLC(:,1) + 0.75); % convert yr class to time since birth (d)
data.tLC(:,2) = 1.12 * data.tLC(:,2); % convert fork length to total length
units.tLC  = {'d', 'cm'};  label.tLC = {'time since birth', 'total length', 'Canary Islands'};  
temp.tLC   = C2K(10);  units.temp.tLC = 'K'; label.temp.tLC = 'temperature';
bibkey.tLC = 'RicoLore2001';
comment.tLC = 'Data from Canary Islands';

%% set weights for all real data
weights = setweights(data, []);
weights.tLA = 5 * weights.tLA;
weights.tLM = 5 * weights.tLM;
weights.tLC = 5 * weights.tLC;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLA','tLM','tLC'}; subtitle1 = {'Data from Azores, Madeira, Canary Ils'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: W in g = 0.01622*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LN55'; % Cat of Life
metaData.links.id_ITIS = '166156'; % ITIS
metaData.links.id_EoL = '46567186'; % Ency of Life
metaData.links.id_Wiki = 'Beryx_splendens'; % Wikipedia
metaData.links.id_ADW = 'Beryx_splendens'; % ADW
metaData.links.id_Taxo = '44739'; % Taxonomicon
metaData.links.id_WoRMS = '126395'; % WoRMS
metaData.links.id_fishbase = 'Beryx-splendens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Beryx_splendens}}';
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
bibkey = 'RicoLore2001'; type = 'Article'; bib = [ ... 
'author = {V. Rico and J. M. Lorenzo and J. A. Gonz''{a}lez and H. M. Krug and A. Mendon\c{c}a and E. Gouveia and M. Afonso Dias}, ' ... 
'year = {2001}, ' ...
'title = {Age and growth of the alfonsino \emph{Beryx splendens} {L}owe, 1834 from the {M}acaronesian archipelagos}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {49}, ' ...
'pages = {233-240}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeisCars2000'; type = 'Book'; bib = [ ...  
'author = {J. M. Leis and B. M. Carson-Ewart}, ' ...
'year = {2000}, ' ...
'title  = {The Larvae of Indo-Pacific Coastal Fishes: An Identification Guide to Marine Fish Larvae (Fauna Malesiana Handbook,)}, ' ...
'publisher = {Brill}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Beryx-splendens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

