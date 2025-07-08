function [data, auxData, metaData, txtData, weights] = mydata_Mytilus_trossulus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Mytilus_trossulus'; 
metaData.species_en = 'Northern bay mussel';

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MPN', 'MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L', 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Emily A Roberts'};   
metaData.date_subm = [2015 04 21];           
metaData.email    = {'earobert@uw.edu'};  
metaData.address  = {'University of Washington, 98195, USA'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Emily A Roberts'};   
metaData.date_mod_2 = [2019 03 16];           
metaData.email_mod_2    = {'earobert@uw.edu'};  
metaData.address_mod_2  = {'University of Washington, 98195, USA'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 16]; 

%% set data
% zero-variate data

data.ab = 1.75;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Strat1987';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 22;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Wate1979';   
  temp.tj = C2K(18);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Seed1976';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value is from Mytilus edulis, but is reasonable for Mytilus trossulus}';
data.am = 1260;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Skid1983';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.011;units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'Wate1979';
  comment.Lb = 'shell height is from umbo to ventral margin';
data.Lj  = 0.027;units.Lj  = 'cm';  label.Lj  = 'shell height at metam';   bibkey.Lj  = 'Wate1979';
data.Lp  = 4.5;  units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'SkidChew1985';
data.Li  = 7.08; units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Elliot2008';

data.Wdb = 7e-7; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'Sand2015';
data.Wdj = 1.035e-5; units.Wdj = 'g';   label.Wdj = 'dry weight at metam';     bibkey.Wdj = 'Sand2015';
  comment.Wdj = 'based on Wdb * (Lj/Lb)^3';
data.Wdp = 0.75; units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'SkidChew1985';
data.Wdi = 3.4;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'SkidChew1985';

data.Ri  = 1.64e4;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wate1979';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL =   [ ...    % time since birth (d), shell height (cm)
81   101  125   161   181   209   257   293   324   351   370   399   424   451   493   522   536;    % d, time since birth
.772 .860 1.173 1.657 2.531 3.075 3.323 3.684 4.009 4.278 4.483 4.860 5.187 5.434 5.546 5.683 5.708]';% cm, shell height
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Skid1983';

% L-W data
data.LW = [ ...
3.8    4.49   5.414 6.375 3.89   4.345  5.559 6.342;     % cm, shell height
0.6954 0.9273 1.45  1.22  0.5518 0.7578 1.327 2.439]';   % g, dry weight at f and T
units.LW   = {'cm', 'g'};  label.LW = {'shell height', 'dry weight'};  
bibkey.LW = 'Skid1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tj = 0 * weights.tj;
weights.Lj = 0 * weights.Lj;
weights.Wdj = 2 * weights.Wdj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_2: t_j and L_j were given zero weight; tj is underestimated, probably due to lower temperature and/or food availability';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '45GSC'; % Cat of Life
metaData.links.id_ITIS = '567928'; % ITIS
metaData.links.id_EoL = '46466842'; % Ency of Life
metaData.links.id_Wiki = 'Mytilus_trossulus'; % Wikipedia
metaData.links.id_ADW = 'Mytilus_trossulus'; % ADW
metaData.links.id_Taxo = '81556'; % Taxonomicon
metaData.links.id_WoRMS = '140482'; % WoRMS
metaData.links.id_molluscabase = '140482'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mytilus_trossulus}}';
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
bibkey = 'Elliot2008'; type = 'Article'; bib = [ ...
'author = {Elliot, J. and K. Holmes and R. Chambers and K. Leon and P. Wimberger}, ' ...
'year = {2008}, ' ...
'title = {Differences in morphology and habitat use among the native mussel \emph{Mytilus trossulus}, the non-native \emph{M. galloprovincialis}, and their hybrids in Puget Sound, Washington. }, ' ...
'journal = {Marine Biology}, ' ...
'volume = {156}, ' ...
'pages = {39-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sand2015'; type = 'Misc'; bib = [ ...
'author = {Sanders, T.}, ' ...
'year = {2015}, ' ...
'note = {unpublished data, Mytilus trossulus from Baltic Sea}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Seed1976'; type = 'incollection'; bib = [ ...
'author = {Seed, R.}, ' ...
'year = {1976}, ' ...
'editor = {Bayne, B.L.}, ' ...
'title = {Ecology}, ' ...
'booktitle = {Marine mussels: their ecology and physiology}, ' ...
'publisher = {Cambridge University Press, Cambridge}, ' ...
'pages = {13-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Skid1983'; type = 'phdthesis'; bib = [ ...
'author = {Skidmore, D. A.}, ' ...
'year = {1983}, ' ...
'title = {Settlement, growth, and survival of \emph{Mytilus edulis} {L}. in {P}uget {S}ound and assessment of \emph{Mytilus californianus} for aquaculture}, ' ...
'school = {University of Washington}, '...
'pages = {40-45}, '...
'note = {\emph{Mytilus  edulis} in this region of study was later identified as \emph{Mytilus trossulus}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SkidChew1985'; type = 'techreport'; bib = [ ...
'author = {Skidmore, D. and Chew, K.K.}, ' ...
'year = {1985}, ' ...
'title = {Mussel aquaculture in Puget Sound}, ' ...
'institution = {Washington Sea Grant Technical Report, University of Washington, Seattle}, '...
'volume = {381}, ' ...
'pages = {179-190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Strat1987'; type = 'Book'; bib = [ ...
'author = {Strathman, M. F.}, ' ...
'year = {1987}, ' ...
'title = {Reproduction and development of marine invertebrates of the northern Pacific coast}, ' ...
'publisher = {University of Washington Press, Seattle}, ' ...
'pages = {620}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wate1979'; type = 'phdthesis'; bib = [ ...
'author = {Waterstrat, P.R.}, ' ...
'year = {1979}, ' ...
'title = {Prospects for the development of a mussel culture industry in Puget Sound}, ' ...
'school = {Thesis M.S., University of Washington}, '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

