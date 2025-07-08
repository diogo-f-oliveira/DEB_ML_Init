function [data, auxData, metaData, txtData, weights] = mydata_Chionoecetes_opilio

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Oregoniidae';
metaData.species    = 'Chionoecetes_opilio'; 
metaData.species_en = 'Snow crab'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MPN', 'MN'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'ab', 'aj', 'ap', 'am', 'Lj', 'Lp', 'Li', 'Wwb', 'Wwj', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 09 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 14]; 

%% set data
% zero-variate data

data.ab = 365;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'ADW';   
  temp.ab = C2K(5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps guessed';
data.tj = 5*30.5;  units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'ADW';   
  temp.tj = C2K(8); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temp is guessed higher because of pelagic stage';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since metam at puberty';  bibkey.tp = 'ADW';
  temp.tp = C2K(5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4*365;  units.tpm = 'd';    label.tpm = 'time since metam at puberty for males';  bibkey.tpm = 'SainRaym1995';
  temp.tpm = C2K(5); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(5);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 0.319;   units.Lj  = 'cm';  label.Lj  = 'carapace length at settle'; bibkey.Lj  = 'SainRaym1995';
data.Lpm  = 3.9;  units.Lpm  = 'cm';  label.Lpm  = 'carapace width at puberty for males'; bibkey.Lpm  = 'SainRaym1995';
data.Li  = 9.5;  units.Li  = 'cm';  label.Li  = 'ultimate carapace width for females'; bibkey.Li  = 'Wiki';
data.Lim  = 16.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate carapace width for males'; bibkey.Lim  = 'ADW';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Macrocheira kaempferi: pi/6*0.07^3';
data.Wwj = 0.016;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';       bibkey.Wwj = 'SainRaym1995';
  comment.Wwj = 'based on (Ljm/ Lim)^3 * Wwim';
data.Wwpm = 29.7;    units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'SainRaym1995';
  comment.Wwpm = 'based on (Lp/ Li)^3 * Wwi';
data.Wwi = 429.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = {'Wiki','HardDuti2000'};
  comment.Wwi = 'based on (Li/ Lim)^3*Wwim';
data.Wwim = 2.25e3;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';         bibkey.Wwim = {'Wiki','HardDuti2000'};
  comment.Wwim = 'based on 11.37 cm carpace width corresponds with 736 g wet weight: (16.5/11.37)^3*736';

data.Ri  = 1.5e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data
data.tL = [ ... % time since settle (yr), carapace width (cm)
0    0.319
0.5  0.463
1    0.660
1.5  0.966
1.8  1.410
2.3  1.996
3.3  2.688
4.3  3.447]; 
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settle', 'carapace width'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SainRaym1995';
comment.tL = 'Data concerns males at St Lawrence Bay';
  
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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Amphipods Ischyrocerus commensalis and Gammaropsis inaequistylis  have been found to live on snow crab carapace Off the coast of Newfoundland';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '5Y5GB'; % Cat of Life
metaData.links.id_ITIS = '98428'; % ITIS
metaData.links.id_EoL = '46508033'; % Ency of Life
metaData.links.id_Wiki = 'Chionoecetes_opilio'; % Wikipedia
metaData.links.id_ADW = 'Chionoecetes_opilio'; % ADW
metaData.links.id_Taxo = '314761'; % Taxonomicon
metaData.links.id_WoRMS = '107315'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chionoecetes_opilio}}';
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
bibkey = 'GrosKona2017'; type = 'Article'; bib = [ ... 
'author = {J. Gro{\ss} and B. Konara and T. Brey and J. M. Grebmeierc}, ' ... 
'year = {2017}, ' ...
'title = {Size-frequency distribution, growth, and mortality of snow crab (\emph{Chionoecetes opilio}) and arctic lyre crab (\emph{Hyas coarctatus}) in the {C}hukchi {S}ea from 2009 to 2013}, ' ...
'journal = {Deep-Sea Research Part II}, ' ...
'doi = {10.1016/j.dsr2.2017.04.021}, ' ...
'note = {to appear}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SainRaym1995'; type = 'Article'; bib = [ ... 
'author = {B. Sainte-Marie and S. Raymond and J.-C. Brethes}, ' ... 
'year = {1995}, ' ...
'title = {Growth and maturation of the benthic stages of male snow crab, \emph{Chionoecetes opilio} ({B}rachyura: {M}ajidae)}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {52}, ' ...
'pages = {903--924}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HardDuti2000'; type = 'Article'; bib = [ ... 
'author = {D. Hardy, J.-D. Dutil and G. Godbout and J. Munro}, ' ... 
'year = {2000}, ' ...
'title = {Survival and condition of hard shell male adult snow crabs \emph{Chionoecetes opilio} during fasting at different temperatures}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {189}, ' ...
'pages = {259-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Chionoecetes_opilio/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
