function [data, auxData, metaData, txtData, weights] = mydata_Gila_atraria
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Gila_atraria'; 
metaData.species_en = 'Utah chub'; 

metaData.ecoCode.climate = {'BWk','BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','jiFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 02]; 

%% set data
% zero-variate data

data.am = 13*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'Neuh1954';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'VarlLive1976';
  comment.Lp = 'based on first spawning at SL 6.7';
data.Li = 56;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase'; 
  
data.Wwb = 2.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.59 mm: pi/6*0.159^3';
data.Wwp = 96;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','VarlLive1976'};
  comment.Wwp = 'based on 0.00813*Lp^3.13, F1';
data.Wwi = 2.41e3;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, F1';


% univariate data
% time-length
data.tL = [ ... % time (yr), std length (cm)
    1  3.8
    2  6.1
    3  9.4
    4 12.5
    5 14.8
    6 16.3
    7 17.5
    8 18.6
    9 20.1
   10 21.9
   12 22.5];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Neuh1954'; 

% length - fecundity
data.LN = [ ...
20.106	10548.998
20.585	13180.579
22.287	16659.896
22.394	24863.133
22.553	20026.492
22.660	9090.148
22.979	13298.327
23.085	12667.915
23.138	18557.294
23.723	26447.562
25.266	45595.249
26.064	60322.195
26.649	30143.627
27.021	58329.141];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'VarlLive1976'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
%weights.Li = 3 * weights.Li;
%weights.Wwb = 5 * weights.Wwb;
%weights.Lp = 5 * weights.Lp;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3G2FV'; % Cat of Life
metaData.links.id_ITIS = '163543'; % ITIS
metaData.links.id_EoL = '994802'; % Ency of Life
metaData.links.id_Wiki = 'Gila_atraria'; % Wikipedia
metaData.links.id_ADW = 'Gila_atraria'; % ADW
metaData.links.id_Taxo = '174931'; % Taxonomicon
metaData.links.id_WoRMS = '1019977'; % WoRMS
metaData.links.id_fishbase = 'Gila-atraria'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gila_atraria}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Gila-atraria.html}}';  
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
bibkey = 'Neuh1954'; type = 'phdthesis'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {John M. Neuhold}, ' ...
'year = {1954}, ' ...
'title  = {Age and Growth of the Utah Chub, \emph{Gila atraria} ({G}irard), in {P}anguitch {L}ake and {N}avajo {L}ake, {U}tah, From Scales and Opercular Bones}, ' ...
'school = {Utah State Univ.}, ' ...
'howpublished = {\url{https://digitalcommons.usu.edu/etd/3769}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%  
bibkey = 'VarlLive1976'; type = 'techreport'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {John D. Varley and John C. Livesay}, ' ...
'year = {1976}, ' ...
'title  = {Utah Ecology and Life History of the Utah Chub, \emph{Gila atraria}, in Flaming Gorge Reservoir, Utah-Wyoming}, ' ...
'institution = {Utah Division of Wildlife Resources}, ' ...
'sereis = {publication}, ', ...
'number = {76-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];