function [data, auxData, metaData, txtData, weights] = mydata_Argentina_sphyraena
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Argentiniformes'; 
metaData.family     = 'Argentinidae';
metaData.species    = 'Argentina_sphyraena'; 
metaData.species_en = 'Lesser silver smelt'; 

metaData.ecoCode.climate = {'MC','MB'};
metaData.ecoCode.ecozone = {'MANE','MAE','MAm'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mpm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 24];

%% set data
% zero-variate data
data.am = 16*365;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';     bibkey.Lp = 'fishbase';
data.Li = 35;     units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'SerrMuno2018';
  comment.Wwb = 'based on egg diameter of 800 mum: pi/6*0.08^3';
data.Wwp = 11.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00363*Lp^3.18, see F4';
data.Wwi = 295.1;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00363*Li^3.18, see F4';

data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';         bibkey.GSI = 'SerrMuno2018';
  temp.GSI = C2K(8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % age (years) ~ Length (cm) 
1	11.520
1	11.311
1	11.224
1	10.616
1	9.937
1	9.051
1	11.103
1	10.998
1	10.911
1	8.911
1	8.790
1	11.903
1	11.433
1	11.746
1	10.685
2	14.346
2	13.094
2	12.364
2	12.033
2	13.772
2	13.564
2	13.198
2	12.851
2	12.259
2	12.172
2	11.911
2	14.694
2	14.642
2	14.590
2	14.190
2	13.877
2	13.355
2	13.268
2	12.937
2	12.711
2	12.537
2	15.390
2	15.077
2	13.494
2	11.807
3	14.598
3	14.459
3	15.851
3	16.216
3	15.659
3	15.468
3	15.364
3	15.190
3	13.677
3	16.390
3	14.911
3	13.937
3	13.816
3	13.329
3	15.085
3	14.233
3	13.520
3	13.172];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-6;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FerrBrci2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 8 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'bathydemersal;';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.00363*(TL in cm)^3.18';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'GGGV'; % Cat of Life
metaData.links.id_ITIS = '162071'; % ITIS
metaData.links.id_EoL = '46562887'; % Ency of Life
metaData.links.id_Wiki = 'Argentina_sphyraena'; % Wikipedia
metaData.links.id_ADW = 'Argentina_sphyraena'; % ADW
metaData.links.id_Taxo = '161605'; % Taxonomicon
metaData.links.id_WoRMS = '126716'; % WoRMS
metaData.links.id_fishbase = 'Argentina-sphyraena'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argentina_sphyraena}}';
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
bibkey = 'FerrBrci2017'; type = 'article'; bib = [ ...  
'author = {Josipa Ferri and Jure Br\v{c}i\''{c} and Frane \v{S}keljo and Lidija Sr\v{s}en and Anja Uvodi\''{c}}, ' ...
'year = {2017}, ' ...
'title  = {A PRELIMINARY STUDY ON THE AGE AND GROWTH OF THE ARGENTINE, \emph{Argentina_sphyraena} ({A}CTINOPTERYGII: {O}SMERIFORMES: {A}RGENTINIDAE) FROM THE EASTERN {A}DRIATIC {S}EA}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {47(4)}, ' ...
'pages = {365–369}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SerrMuno2018'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10641-018-0763-x}, ' ...
'author = {Serrat, A. and Mu\~{n}oz, M. and Lloret, J.}, ' ...
'year = {2018}, ' ...
'title  = {Condition and reproductive strategy of the \emph{Argentina sphyraena}, a cold-water species in the {M}editerranean {S}ea}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {101(6)}, ' ...
'pages = {1083–1096}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Argentina-sphyraena.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

