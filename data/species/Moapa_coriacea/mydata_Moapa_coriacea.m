function [data, auxData, metaData, txtData, weights] = mydata_Moapa_coriacea

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Moapa_coriacea'; 
metaData.species_en = 'Moapa dace'; 

metaData.ecoCode.climate = {'Dsa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'L-dL'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 19]; 

%% set data
% zero-variate data

data.tp = 0.7*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(29); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(29); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4.2;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'ScopBurg1992'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 9.8;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.10^3';
data.Wwp = 0.72;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','ScopBurg1992'};
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 10.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

%% univariate data
 
% time-length
data.LdL = [ ... % total length (cm), change in standard length (cm/d)
2.5	0.01703
3.5	0.00732
4.5	0.00336
5.5	0.00198
6.5	0.00135
7.5	0.00164];
units.LdL = {'cm', 'cm/d'}; label.LdL = {'total length', 'change in total length'};  
temp.LdL = C2K(29);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Here2014'; 

% length - fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
4.131	94.550
4.477	90.754
4.513	60.692
4.596	99.498
4.805	108.174
5.089	150.362
5.090	196.297
5.199	180.314
5.281	204.986
5.482	218.969
5.508	181.846
5.974	241.564
5.982	206.222
5.984	259.225
6.374	221.827
6.595	295.865
6.888	391.049
7.187	311.318
8.370	630.210
8.488	638.954
8.577	562.915
8.704	559.285
8.983	772.855];
data.LN(:,1) = data.LN(:,1)/0.95; % convert FL to TL
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(29);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ScopBurg1992'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL=0.95*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '43STQ'; % Cat of Life
metaData.links.id_ITIS = '163585'; % ITIS
metaData.links.id_EoL = '207902'; % Ency of Life
metaData.links.id_Wiki = 'Moapa_coriacea'; % Wikipedia
metaData.links.id_ADW = 'Moapa_coriacea'; % ADW
metaData.links.id_Taxo = '180176'; % Taxonomicon
metaData.links.id_WoRMS = '1014301'; % WoRMS
metaData.links.id_fishbase = 'Moapa-coriacea'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moapa_coriacea}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Moapa-coriacea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Here2014'; type = 'phdthesis'; bib = [ ... 
'author = {Mark E. Hereford}, ' ...
'year = {2014}, ' ...
'title  = {Home range, spatial dynamics, and growth of Moapa dace (\emph{Moapa coriacea})}, ' ...
'school = {University of Nevada, Reno}'];
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
bibkey = 'ScopBurg1992'; type = 'Article'; bib = [ ... 
'author = {C. Gary Scoppettone and Howard L. Burge and Peter L. Tuttle}, ' ... 
'year = {1992}, ' ...
'title = {Life history, abundance, and distribution of Moapa dace (\emph{Moapa coriacea})}, ' ...
'journal = {Great Basin Naturalist}, ' ...
'volume = {52}, ' ...
'pages = {216-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

