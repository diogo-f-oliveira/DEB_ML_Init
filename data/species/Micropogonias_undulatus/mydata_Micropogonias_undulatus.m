function [data, auxData, metaData, txtData, weights] = mydata_Micropogonias_undulatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Micropogonias_undulatus'; 
metaData.species_en = 'Atlantic croaker'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 19]; 

%% set data
% zero-variate data

data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishesoftexas';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishesoftexas'; 
data.Li  = 55;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'BarbCit1994';
  comment.Wwb = 'based on egg diameter og 0.8 mm: pi/6*0.08^3';
data.Wwp = 80.7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','fishesoftexas'};
  comment.Wwp = 'based on 0.00871*Lp^3.16, see F1';
data.Wwi = 2.75e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.16, see F1';

data.GSI = 0.07 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';          bibkey.GSI = 'BarbCit1994'; 
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (d), total length (cm)
    1 19.2
    2 23.5
    3 26.9
    4 29.2
    5 31.0
    6 32.7
    7 34.2
    8 35.6
    9 36.7
   10 38.2
   11 39.2
   12 40.7
   13 40.8
   14 41.5
   15 45.5];
data.tL(:,1) = (1.3 + data.tL(:,1))*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HaleReit1992';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.tL(end) = 0;


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.16'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.84*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4343K'; % Cat of Life
metaData.links.id_ITIS = '169283'; % ITIS
metaData.links.id_EoL = '46578960'; % Ency of Life
metaData.links.id_Wiki = 'Micropogonias_undulatus'; % Wikipedia
metaData.links.id_ADW = 'Micropogonias_undulatus'; % ADW
metaData.links.id_Taxo = '154143'; % Taxonomicon
metaData.links.id_WoRMS = '151158'; % WoRMS
metaData.links.id_fishbase = 'Micropogonias-undulatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropogonias_undulatus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Micropogonias-undulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/micropogonias undulatus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaleReit1992'; type = 'Article'; bib = [ ... 
'author = {L. Stanton Hales and Elizabeth J. Reitzh}, ' ...
'year = {1992}, ' ...
'title  = {Historical Changes in Age and Growth of {A}tlantic Croaker, \emph{Micropogonias undulatus} ({P}erciformes: {S}ciaenidae)}, ' ...
'journal = {Journal of Archoeological Science}, ' ...
'volume = {19}, ' ...
'pages = {13-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarbCit1994'; type = 'Article'; bib = [ ... 
'author = {Barbieri, Luiz R. and Chittenden, Mark E. and Lowerre-Barbieri, Susan K.}, ' ...
'year = {1994}, ' ...
'title  = {Maturity, Spawning, And Ovarian Cycle Of {A}tlantic Croaker, \emph{Micropogonias-Undulatus}, In The {C}hesapeake {B}ay And Adjacent Coastal Waters}, ' ...
'journal = {VIMS Articles}, ' ...
'volume = {594}, ' ...
'pages = {13-99}, ' ...
'howpublished = {\url{https://scholarworks.wm.edu/vimsarticles/594}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

