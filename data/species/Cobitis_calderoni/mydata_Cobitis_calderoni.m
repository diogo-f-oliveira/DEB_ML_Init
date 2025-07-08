  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_calderoni
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_calderoni'; 
metaData.species_en = 'Lamprehuela'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 09];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'VallPryz2008';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.8;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
data.Li = 9.1;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'VallPryz2008';
  comment.Li = 'fishbase gives 10 cm';

data.Wwb = 1.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'VallPryz2008';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 0.26;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00447*Lp^3.05, see F1';
data.Wwi = 3.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'VallPryz2008','fishbase'};
  comment.Wwi = 'Based on 0.00447*Li^3.05, see F1';

data.Ri = 968/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'VallPryz2008';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on batch fecundity 0.0035*(SL in mm)^3.0362, where SL 62 mm is largest observed ';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1	3.26
2	4.19
3	4.83
4	5.78];
data.tL(:,1) = 365 * (0.4+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VallPryz2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00447*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'known from the Iberian Peninsula';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WJWX'; % Cat of Life
metaData.links.id_ITIS = '687840'; % ITIS
metaData.links.id_EoL = '218216'; % Ency of Life
metaData.links.id_Wiki = 'Cobitis_calderoni'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_calderoni'; % ADW
metaData.links.id_Taxo = '171498'; % Taxonomicon
metaData.links.id_WoRMS = '1013670'; % WoRMS
metaData.links.id_fishbase = 'Cobitis-calderoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis_calderoni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VallPryz2008'; type = 'Article'; bib = [ ...  
'author = {Valladolid, M. and M. Pryzbylski}, ' ...
'year = {2008}, ' ...
'title = {Life history traits of the endangered {I}berian loach \emph{Cobitis calderoni} in the {R}iver {L}ozoya, {C}entral {S}pain}, ' ... 
'journal = {Folia Zool.}, ' ...
'volume = {57(1-2)}, '...
'pages = {147-154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cobitis-calderoni}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

