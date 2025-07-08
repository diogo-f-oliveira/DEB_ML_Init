function [data, auxData, metaData, txtData, weights] = mydata_Pimephales_vigilax

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pimephales_vigilax'; 
metaData.species_en = 'Bullhead minnow'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 12]; 

%% set data
% zero-variate data

data.ab = 5.5;   units.ab = 'd';  label.ab = 'age at birth';                    bibkey.ab = 'Park1964';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishesoftexas';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 8.89;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishesoftexas'; 
  comment.Li = 'based on SL 7.2 cm and F2';
  
data.Wwb = 1.4e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1.4 mm : pi/6*0.14^3';
data.Wwp = 0.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 5.92;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';
  
data.Ri  = 900/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of P notatus (4e3) and P promelas (1e5)';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 3.5
    1 6.9];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

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
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4HWSV'; % Cat of Life
metaData.links.id_ITIS = '163518'; % ITIS
metaData.links.id_EoL = '218125'; % Ency of Life
metaData.links.id_Wiki = 'Pimephales_vigilax'; % Wikipedia
metaData.links.id_ADW = 'Pimephales_vigilax'; % ADW
metaData.links.id_Taxo = '183917'; % Taxonomicon
metaData.links.id_WoRMS = '1044815'; % WoRMS
metaData.links.id_fishbase = 'Pimephales-vigilax'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pimephales_vigilax}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pimephales-vigilax.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/pimephales vigilax.htm}}';  
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
%
bibkey = 'Park1964'; type = 'Article'; bib = [ ... 
'author = {Henry L. Parker}, ' ... 
'year = {1964}, ' ...
'title = {Natural History of \emph{Pimephales vigilax} ({C}yprinidae)}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'volume = {8(4)}, ' ...
'pages = {228-235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

