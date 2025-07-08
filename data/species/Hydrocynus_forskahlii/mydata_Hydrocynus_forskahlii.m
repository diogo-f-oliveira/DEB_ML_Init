  function [data, auxData, metaData, txtData, weights] = mydata_Hydrocynus_forskahlii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Alestidae';
metaData.species    = 'Hydrocynus_forskahlii'; 
metaData.species_en = 'Elongate tigerfish'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lh'; 'Lb'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 04 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 04 09]; 

%% set data
% zero-variate data
data.ab = 4.5; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'RafaAlko1973';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 78;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 6.9e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Paug2002';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwi = 6.9e3;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight: 15.5 kg; 0.00759*Li^3.15, see F1, gives 6.9 kg';
  
data.Ri = 8.4e4/365; units.Ri = '#/d'; label.Ri = 'reprod rate at Ww = 1.7 kg'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Hydrocynus_vittatus: 342000*6.9/28';

% univariate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1 21.4  40
    2 32.7 232
    3 42.4 325
    4 47.5 441
    5 50.3 626
    6 52.5 718];
data.tLW(:,1) = 365 * (0.9*data.tLW(:,1)); % convert yr to d
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW   = C2K(28);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'RafaAlko1973'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
    27.5  97.5
    28.5 10.93
    29.5 122.1
    30.5 135.9
    31.5 150.8
    32.5 166.7 
    33.5 183.7
    34.5 201.9
    35.5 221.3
    37.5 263.9
    38.5 287.3
    39.5 311.9
    40.5 338.2
    41.5 365.4
    42.5 394.6
    43.5 425.2
    44.5 457.5
    46.5 409.8
    47.5 439.7
    48.5 471.2
    49.5 504.3
    50.5 539.3 
    51.5 575.7
    54.5 695.2];
units.LW  = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'RafaAlko1973';



%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Wwi is ignored due to inconcictency with tWw and LWw data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.15';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3N6V9'; % Cat of Life
metaData.links.id_ITIS = '641101'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Hydrocynus_forskahlii'; % Wikipedia
metaData.links.id_ADW = 'Hydrocynus_forskahlii'; % ADW
metaData.links.id_Taxo = '416337'; % Taxonomicon
metaData.links.id_WoRMS = '581706'; % WoRMS
metaData.links.id_fishbase = 'Hydrocynus-forskahlii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hydrocynus_forskahlii}}';  
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
bibkey = 'RafaAlko1973'; type = 'Article'; bib = [ ...    
'author = {Rafail, S. Z. and A. Alkoholy and M. Malidi}, ' ...
'year  = {1973}, ' ...
'title = {Biological studies on {S}undanese {I}nland fishes. {III}. \emph{Hydrocyon forskalii} {C}uvier}, ' ...  
'journal = {Bull. Inst. Ocean. Pish. (Cairo)}, ' ...
'volume = {3}, ' ...
'pages = {276-293}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Paug2002'; type = 'Article'; bib = [ ...    
'author = {Didier Paugy}, ' ...
'year  = {2002}, ' ...
'title = {Reproductive strategies of fishes in a tropical temporary stream of the Upper {S}enegal basin: {B}aoul\''{e} {R}iver in {M}ali}, ' ...  
'journal = {Aquat. Living Resour}, ' ...
'volume = {15}, ' ...
'pages = {25–35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/4496}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

