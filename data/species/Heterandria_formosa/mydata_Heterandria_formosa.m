  function [data, auxData, metaData, txtData, weights] = mydata_Heterandria_formosa
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Heterandria_formosa'; 
metaData.species_en = 'Least killifish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 31];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 07 31]; 

%% set data
% zero-variate data
data.ab = 35;        units.ab = 'd';  label.ab = 'age at birth';        bibkey.ab = 'Henr1988';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 75.2;        units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'Henr1988';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 77.6;        units.tpm = 'd';  label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Henr1988';
  temp.tpm = C2K(28); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8*30.5;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'Brow2016';
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.70;  units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'Henr1988';
data.Lp = 1.4;  units.Lp = 'cm';  label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Lpm = 1.2;  units.Lpm = 'cm';  label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'fishbase';
data.Li = 3.6;  units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
data.Lim = 3; units.Lim = 'cm'; label.Lim = 'ultimate total length for male';  bibkey.Lim = 'guess';

data.Wwb = 6.6e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = {'Henr1988','fishbase'};   
  comment.Wwb = 'based on 0.0195*Lb^3.03, see F1';
data.Wwp = 0.0541; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Henr1988';
  comment.Wwp = 'based on 0.0195*Lp^3.03, see F1, Henr1988 gived 0.635 g';
data.Wwpm = 0.0339; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';    bibkey.Wwpm = 'Henr1988';
  comment.Wwpm = 'based on 0.0195*Lpm^3.03, see F1, Henr1988 gives 0.652 g';
data.Wwi = 0.945; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0195*Li^3.03, see F1';
data.Wwim = 0.544; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = {'guess','fishbase'};
   comment.Wwi = 'based on 0.0195*Lim^3.03, see F1';

data.Ri = 111/8/30.5;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Brow2016';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight length relationship: Ww in g = 0.0195 * (TL in cm)^3.03';  
  metaData.bibkey.F1 = 'fishbase';
F2 = 'viviparous';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6LQXY'; % Cat of Life
metaData.links.id_ITIS = '165915'; % ITIS
metaData.links.id_EoL = '46566818'; % Ency of Life
metaData.links.id_Wiki = 'Heterandria_formosa'; % Wikipedia
metaData.links.id_ADW = 'Heterandria_formosa'; % ADW
metaData.links.id_Taxo = '92967'; % Taxonomicon
metaData.links.id_WoRMS = '281052'; % WoRMS
metaData.links.id_fishbase = 'Heterandria-formosa'; % fishbase


%% References

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Heterandria-formosa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Heterandria_formosa}}';
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
bibkey = 'Scri1944'; type = 'Article'; bib = [ ...
'author = {Nevin S. Scrimshaw}, ' ...
'year = {1944}, ' ...
'title = {Embryonic Growth in the Viviparous {P}oeciliid, \emph{Heterandria formosa}}, ' ... 
'journal = {Biological Bulletin}, ' ...
'volume = {87(1)}, '...
'pages = {37-51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Henr1988'; type = 'Article'; bib = [ ...
'author = {Sabine Henrich}, ' ...
'year = {1988}, ' ...
'title = {Variation in offspring sizes of the poeciliid fish \emph{Heterandria formosa} in relation to fitness}, ' ... 
'journal = {Oikos}, ' ...
'volume = {51}, '...
'pages = {13-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brow2016'; type = 'phdthesis'; bib = [ ...  
'author = {James Oliver Brown}, ' ...
'year = {2016}, ' ...
'title = {Environmental effects on fecundity in mothers of the least killifish, \emph{Heterandria formosa}}, ' ... 
'institution = {Forida State Univ.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

