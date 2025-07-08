function [data, auxData, metaData, txtData, weights] = mydata_Pristis_microdon

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Pristidae';
metaData.species    = 'Pristis_microdon'; 
metaData.species_en = 'Largetooth sawfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMcd','0iMm','0iFe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 25];

%% set data
% zero-variate data;
data.ab = 5*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(28.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp of all data is guessed';
data.am = 80*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Peve2010';   
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fishbase gives max reported age 30 yr';

data.Lb  = 81;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki';
  comment.Lb = '72–90 cm';
data.Lp  = 270;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'guess'; 
data.Li  = 700;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 2.4e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.05, see F1; max published weight 600 kg';

data.Ri  = 7/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-13 pups per clutch; possibily 1 litter per 2 yr';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
    0  90
    1 128
    2 158
    3 195
    4 245
    5 255
   28 582];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Peve2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'predicted age at birth is much larger than "observed"';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00501*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4MK2K'; % Cat of Life
metaData.links.id_ITIS = '160812'; % ITIS
metaData.links.id_EoL = '46560363'; % Ency of Life
metaData.links.id_Wiki = 'Pristis_microdon'; % Wikipedia
metaData.links.id_ADW = 'Pristis_microdon'; % ADW
metaData.links.id_Taxo = '42015'; % Taxonomicon
metaData.links.id_WoRMS = '217376'; % WoRMS
metaData.links.id_fishbase = 'Pristis-microdon'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristis_microdon}}'; 
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
bibkey = 'Peve2010'; type = 'phdthesis'; bib = [ ...  
'howpublished = {\url{https://researchonline.jcu.edu.au/29567/}}, ' ...
'doi = {10.25903/my5r-mr82}, ' ...
'author = {Peverell, Stirling Charles}, ' ...
'year = {2010}, ' ...
'title  = {Sawfish ({P}ristidae) of the {G}ulf of {C}arpentaria, {Q}ueensland, {A}ustralia.}, ' ...
'school = {James Cook University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pristis-microdon.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 