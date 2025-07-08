function [data, auxData, metaData, txtData, weights] = mydata_Notropis_girardi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_girardi'; 
metaData.species_en = 'Arkansas River shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHa','biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 11]; 

%% set data
% zero-variate data

data.am = 2.5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishesoftexas';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 2.4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishesoftexas'; 
data.Li = 6.5;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishesoftexas'; 
  
data.Wwb = 1.72e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = {'fishesoftexas','Cobu1986'};
  comment.Wwb = 'based on egg diameter of 0.69 mm: pi/6*0.069^3';
data.Wwp = 0.13;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 2.85;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';
  
data.R4  = 1012/365; units.R4  = '#/d';label.R4  = 'max reprod rate at TL 3.9 cm';    bibkey.R4  = 'fishesoftexas';   
  temp.R4 = C2K(20); units.temp.R4 = 'K'; label.temp.R4 = 'temperature';
data.R5  = 3246/365; units.R5  = '#/d';label.R5  = 'max reprod rate at TL 4.9 cm';    bibkey.R5  = 'fishesoftexas';   
  temp.R5 = C2K(20); units.temp.R5 = 'K'; label.temp.R5 = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    4 0.54
    7 0.77
   22 1.60
   40 2.45
   59 2.80
  183 3.45
  210 3.54];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';
comment.tL = 'temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZGR'; % Cat of Life
metaData.links.id_ITIS = '163442'; % ITIS
metaData.links.id_EoL = '207993'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_girardi'; % Wikipedia
metaData.links.id_ADW = 'Notropis_girardi'; % ADW
metaData.links.id_Taxo = '181503'; % Taxonomicon
metaData.links.id_WoRMS = '1015954'; % WoRMS
metaData.links.id_fishbase = 'Notropis-girardi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_girardi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-girardi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/notropis girardi.htm}}';  
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
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

