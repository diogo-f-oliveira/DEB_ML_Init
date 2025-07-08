  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_macrolepidotum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_macrolepidotum'; 
metaData.species_en = 'Shorthead redhorse'; 

metaData.ecoCode.climate = {,'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 27]; 

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'SuleSkel1985';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'SuleSkel1985'; 
  comment.Lp = 'based on tp < 5 yr and tL data';
data.Li = 75;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 3.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'SuleSkel1985';
  comment.Wwb = 'based on egg diameter of 1.6-2.1 mm: pi/6*0.19^3';
data.Wwp = 379; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','SuleSkel1985'};
  comment.Wwp = 'based on 0.01072*Lp^2.97, see F1';
data.Wwi = 3.97e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.97, see F1';

data.Ri = 44e3/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
tLW = [ ... % year class (yr), total length (cm), wet weight (g)
    1 10.5  12
    2 22.8 121
    2 24.1 144
    3 32.3 336
    3 33.6 367
    3 32.0 351
    4 35.5 435
    4 36.1 449
    4 34.7 413
    5 37.1 498
    5 37.3 499
    5 37.0 497
    6 39.6 573
    6 39.9 586
    6 38.4 529
    7 40.4 606
    8 40.2 690];
data.tL = tLW(:,1:2); 
data.tL(:,1) = (-0.2 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SuleSkel1985';

% length - weight
data.LWw = tLW(:,2:3); 
units.LWw = {'cm', 'g'}; label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'SuleSkel1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01072 * (TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6S2VL'; % Cat of Life
metaData.links.id_ITIS = '163928'; % ITIS
metaData.links.id_EoL = '204289'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_macrolepidotum'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_macrolepidotum'; % ADW
metaData.links.id_Taxo = '180414'; % Taxonomicon
metaData.links.id_WoRMS = '593217'; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-macrolepidotum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_macrolepidotum}}';  
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
bibkey = 'SuleSkel1985'; type = 'techreport'; bib = [ ...  
'author = {Michael J. Sule and Thomas M. Skelly}, ' ...
'year = {1985}, ' ...
'title = {The life history of the shorthead Redhorse, \emph{Moxostoma macrolepidotun} in the {K}ankakee {R}iver {D}rainage, {I}llinois, in the {J}ames {R}iver, {M}issouri}, ' ... 
'institution = {State of Illinois, Dept of Energy and Nature Resources; Nat. His Survey Division}, ' ...
'volume = 123}, '...
'series = {Biological Notes}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-macrolepidotum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

