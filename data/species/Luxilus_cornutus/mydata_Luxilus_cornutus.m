function [data, auxData, metaData, txtData, weights] = mydata_Luxilus_cornutus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Luxilus_cornutus'; 
metaData.species_en = 'Common shiner'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_f'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 23]; 

%% set data
% zero-variate data

data.tp = 2*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'Wiki';   
  temp.tp = C2K(21.9); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 9*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(21.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 7.4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
data.Li = 18;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Cobu1986';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 4.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00813*Lp^3.14, see F1';
data.Wwi = 71;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.14, see F1';

%% univariate data
 
% time-length
data.tL_MRf = [ ... % time since birth (yr), total length (cm)
    1 4.212
    2 6.120];
data.tL_MRf(:,1) = 365 * (0 + data.tL_MRf(:,1));
units.tL_MRf = {'d', 'cm'}; label.tL_MRf = {'time since birth', 'total length', 'female, Des Moines River, Iowa 1964'};  
temp.tL_MRf = C2K(21.9);  units.temp.tL_MRf = 'K'; label.temp.tL_MRf = 'temperature';
bibkey.tL_MRf = 'Fee1965'; 
comment.tL_MRf = 'Data for females from Des Moines River, Iowa 1964';
%
data.tL_MRm = [ ... % time since birth (d), total length (cm)
    1  4.634
    2  6.695
    3  7.825
    4  9.700
    5 11.600];
data.tL_MRm(:,1) = 365 * (0 + data.tL_MRm(:,1));
units.tL_MRm = {'d', 'cm'}; label.tL_MRm = {'time since birth', 'total length', 'male, Des Moines River, Iowa 1964'};  
temp.tL_MRm = C2K(21.9);  units.temp.tL_MRm = 'K'; label.temp.tL_MRm = 'temperature';
bibkey.tL_MRm = 'Fee1965'; 
comment.tL_MRm = 'Data for males from Des Moines River, Iowa 1964';
%
data.tL_SCf = [ ... % time since birth (d), total length (cm)
    1 4.230
    2 6.470
    3 7.967];
data.tL_SCf(:,1) = 365 * (0 + data.tL_SCf(:,1));
units.tL_SCf = {'d', 'cm'}; label.tL_SCf = {'time since birth', 'total length', 'female, Squaw Creek, Iowa 1964'};  
temp.tL_SCf = C2K(21.9);  units.temp.tL_SCf = 'K'; label.temp.tL_SCf = 'temperature';
bibkey.tL_SCf = 'Fee1965'; 
comment.tL_SCf = 'Data for females from Squaw Creek, Iowa 1964';
%
data.tL_SCm = [ ... % time since birth (d), total length (cm)
    1 4.390
    2 7.512
    3 9.500];
data.tL_SCm(:,1) = 365 * (0 + data.tL_SCm(:,1));
units.tL_SCm = {'d', 'cm'}; label.tL_SCm = {'time since birth', 'total length', 'male, Squaw Creek, Iowa 1964'};  
temp.tL_SCm = C2K(21.9);  units.temp.tL_SCm = 'K'; label.temp.tL_SCm = 'temperature';
bibkey.tL_SCm = 'Fee1965'; 
comment.tL_SCm = 'Data for males from Squaw Creek, Iowa 1964';

% weight - fecundity
data.WN = [ ... % wet weight (g), fecundity (#)
2.004	387.103
2.849	565.311
3.404	537.251
3.514	643.860
4.175	619.144
4.763	1214.117
6.153	1174.946
9.168	1581.754
9.742	1918.564];
units.WN = {'g', '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(21.9);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Fee1965'; 
comment.WN = 'Data from Des Moines River and Squaw Creek, Iowa 1964';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_MRf', 'tL_MRm','tL_SCf', 'tL_SCm'}; subtitle1 = {'Data for females, males from Des Moines River, Squaw Creek'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperature is the preferred one, but varied between 0 and 27 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3WH79'; % Cat of Life
metaData.links.id_ITIS = '163836'; % ITIS
metaData.links.id_EoL = '217908'; % Ency of Life
metaData.links.id_Wiki = 'Luxilus_cornutus'; % Wikipedia
metaData.links.id_ADW = 'Luxilus_cornutus'; % ADW
metaData.links.id_Taxo = '179243'; % Taxonomicon
metaData.links.id_WoRMS = '862600'; % WoRMS
metaData.links.id_fishbase = 'Luxilus-cornutus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luxilus_cornutus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Luxilus-cornutus.html}}';  
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
bibkey = 'Fee1965'; type = 'Article'; bib = [ ... 
'author = {Fee, Everett}, ' ... 
'year = {1965}, ' ...
'title = {Life History of the Northern Common Shiner, \emph{Notropis cornutus frontalis}, in {B}oone {C}ounty, {l}owa}, ' ...
'journal = {Proceedings of the Iowa Academy of Science}, ' ...
'volume = {72(1)}, ' ...
'pages = {Article 41}'];
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

