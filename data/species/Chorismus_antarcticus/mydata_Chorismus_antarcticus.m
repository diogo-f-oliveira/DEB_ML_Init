function [data, auxData, metaData, txtData, weights] = mydata_Chorismus_antarcticus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Hippolytidae';
metaData.species    = 'Chorismus_antarcticus'; 
metaData.species_en = 'Antarctic shrimp'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'ab';'am';'Lb';'Lj';'Lp';'Li';'Wwb';'Wdi';'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'}; 
metaData.date_subm   = [2018 07 22]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 22]; 

%% set data
% zero-variate data

data.ab = 11*30.5;  units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'GornBrey1993';   
  temp.ab = C2K(2); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;    units.am = 'd';   label.am = 'life span';                   bibkey.am = 'GornBrey1993';   
  temp.am = C2K(2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.21;    units.Lb  = 'cm'; label.Lb  = 'carapace at birth';          bibkey.Lb  = 'GornBrey1993';
data.Lp  = 1.1;     units.Lp  = 'cm'; label.Lp  = 'carapace at puberty';        bibkey.Lp  = 'GornBrey1993';
data.Li  = 2.00;    units.Li  = 'cm'; label.Li  = 'ultimate carapace length';   bibkey.Li  = 'GornBrey1993';

data.Wwb = 7e-4;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'value of Pandalus';
data.Wdi = 0.840;   units.Wdi = 'g';  label.Wdi = 'ultimate dry weight';        bibkey.Wdi = 'GornBrey1993';
 
data.Ri  = 372/365; units.Ri  = '#/d'; label.Ri  = 'maximum reproduction rate'; bibkey.Ri  = 'GornBrey1993';   
  temp.Ri = C2K(2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), carapace length (cm)
0.899	0.207
1.852	0.650
2.121	0.739
2.879	0.946
3.099	1.141
3.331	1.246
3.857	1.338
4.114	1.440
4.320	1.539
4.858	1.542
5.114	1.535
5.319	1.535
5.872	1.736
6.114	1.633
6.331	1.629];  
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL   = C2K(2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GornBrey1993';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males and females are assumed to have the same parameters';
D2 = 'temperature is guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Dominant benthic shrimp in sponge communities of the Weddell Sea shelft';
metaData.bibkey.F1 = 'GornBrey1993'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '84MCG'; % Cat of Life only present at genus level
metaData.links.id_ITIS = '660025'; % ITIS
metaData.links.id_EoL = '46514118'; % Ency of Life
metaData.links.id_Wiki = 'Hippolytidae'; % Wikipedia
metaData.links.id_ADW = 'Chorismus_antarcticus'; % ADW
metaData.links.id_Taxo = '3508383'; % Taxonomicon
metaData.links.id_WoRMS = '369214'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hippolytidae}}';
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
bibkey = 'GornBrey1993'; type = 'Article'; bib = [ ... 
'author = {M. Gorny and T. Brey and W. Arntz and T. Bruns}, ' ... 
'year = {1993}, ' ...
'title = {Growth, development and productivity of \emph{Chorismus antarcticus} (Pfeffer) ({Crustacea: Decapoda: Natantia}) in the easern {Weddell Sea, Antarctica}}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {174}, ' ...
'pages = {261--275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
