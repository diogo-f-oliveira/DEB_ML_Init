  function [data, auxData, metaData, txtData, weights] = mydata_Rhodeus_sericeus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rhodeus_sericeus'; 
metaData.species_en = 'Amur bitterling'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 06];

%% set data
% zero-variate data
data.ab = 18;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Rhodeus amarus';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.5;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 11;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'PrzyGarc2004 gives TL 7.5 cm';

data.Wwb = 0.002;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BattStoi2005';
  comment.Wwb = 'based on Rhodeus amarus';
data.Wwp = 0.43;    units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.07, see F1';
data.Wwi = 14.4;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.07, see F1';
  
data.Ri = 500/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at 4 cm';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 3.71
    2 4.35
    3 5.06
    4 5.68
    5 6.44];
data.tL(:,1) = 365 * (0.3+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PrzyGarc2004';
comment.tL = 'based on length-frequency data';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
F2 = 'eggs are deposited in mussels and stay there 15-30 d post fertilisation';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '796MF'; % Cat of Life
metaData.links.id_ITIS = '689966'; % ITIS
metaData.links.id_EoL = '204542'; % Ency of Life
metaData.links.id_Wiki = 'Rhodeus_sericeus'; % Wikipedia
metaData.links.id_ADW = 'Rhodeus_sericeus'; % ADW
metaData.links.id_Taxo = '43722'; % Taxonomicon
metaData.links.id_WoRMS = '154613'; % WoRMS
metaData.links.id_fishbase = 'Rhodeus-sericeus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhodeus_sericeus}}';  
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
bibkey = 'BattStoi2005'; type = 'Article'; bib = [ ...  
'author = {K. W. Battes and I. Stoica}, ' ...
'year = {2005}, ' ...
'title = {BITTERLING GROWTH BIOLOGY (\emph{Rhodeus amarus} {L}.) IN THE {B}ISTRIA {R}IVER}, ' ... 
'journal = {Analele Univ. Oradea, Fasc. Biologie}, ' ...
'volume = {12}, '...
'pages = {21--29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrzyGarc2004'; type = 'Article'; bib = [ ...  
'author = {Miros{\l}aw Przybylski1 and Emili Garc\''{i}a-Berthou}, ' ...
'year = {2004}, ' ...
'title = {Age and growth of European bitterling (\emph{Rhodeus sericeus}) in the {W}ieprz-{K}rzna {C}anal, {P}oland}, ' ... 
'journal = {Ecohydrology and Hydrobiology}, ' ...
'volume = {4(2)}, '...
'pages = {207-213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhodeus-sericeus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

