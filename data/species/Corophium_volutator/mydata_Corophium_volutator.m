function [data, auxData, metaData, txtData, weights] = mydata_Corophium_volutator

 
%% set metadata
metaData.species    = 'Corophium_volutator'; 
metaData.species_en = 'Amphipod'; 
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Corophiidae';
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Wd'};                                    % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Anouk Goedknegt'};  
metaData.date_subm  = [2015 07 01]; 
metaData.email    = {'anouk.goedknegt@gmail.com'};   
metaData.address  = {'NIOZ, Texel'};  

metaData.author_mod_1  = {'Bas Kooijman'};          
metaData.date_mod_1    = [2016 02 22];                  
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data

data.ab = 14;         units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = {'FishMill1979', 'MollRose1982'};   % (age 0 is at onset of embryo development) 
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 29;         units.ap = 'd';    label.ap = 'age at puberty';              bibkey.ap = 'MollRose1982';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 365;        units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Hugh1988';   % (accounting for aging only) 
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.1;        units.Lb = 'cm';   label.Lb = 'physical length at birth';    bibkey.Lb = {'FishMill1979', 'MollRose1982'};
data.Lp = 0.5;        units.Lp = 'cm';   label.Lp = 'physical length at puberty';  bibkey.Lp = {'MeisBick1997', 'FishMill1979', 'MollRose1982'};
data.Li = 1.05;       units.Li = 'cm';   label.Li = 'ultimate physical length';    bibkey.Li = 'MollRose1982';

data.Wdi = 6.594e-3;  units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';        bibkey.Wdi = 'Birk1977'; % Calculated from length-weight regressions

data.Ri = 0.2904;     units.Ri = '#/d';  label.Ri = 'maximum reprod rate';         bibkey.Ri = 'ConrDepl1999';  % Calculated from max eggs (53) x 2 broods in life span (365 days)
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% uni-variate data at f = 0.8 (this value should be added in pars_init as a parameter f_tL) 
t_cages = [0 9 22 43 60 73 91 126];   % d, time since cages were set on the mudflat 
age_cages = t_cages + 10 ;            % d, time of experiment in the life of the organism 
length = [ 0.1477  0.2102   0.2386  0.3068   0.3864 0.4261 0.4659  0.6477]; % cm, physical length at f and T (Temperature range 10-20 C)
data.tL = [  age_cages; length]';
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'physical length'};  bibkey.tL = 'Birk1977';
  temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'the original data are given in time since cages were set on the mudflat. We added ten day to represent the time of the experiment in the life of the organism.';  
  
% length (cm), dry weight (mg)
data.LWd = [3.7804e-1    4.2712e-1     4.7909e-1    5.1602e-1    5.7949e-1    6.2930e-1    6.7374e-1    7.3001e-1; % cm, physical lenght at f and T 
         0.23922      0.32550       0.46185      0.58180      0.71286      0.76475      0.86147      1.2221;]';    % mg, dry weight  
 units.LWd = {'cm', 'mg'};     label.LWd = {'physical length', 'dry weight'};  bibkey.LWd = 'Birk1977';
 % temp.LWd = C2K(25);  % K, (Temperature range 10-20 C)
  
%% set weights for all real data
weights = setweights(data, []);
% zero-variate data:
weights.Lb = 2 * weights.Lb;
weights.Lp = 2 * weights.Lp;
weights.Li = 2 * weights.Li;
weights.Wdi = 0 * weights.Wdi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.tL = 5 * weights.tL;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'YHFR'; % Cat of Life
metaData.links.id_ITIS = '93601'; % ITIS
metaData.links.id_EoL = '46528488'; % Ency of Life
metaData.links.id_Wiki = 'Corophium_volutator'; % Wikipedia
metaData.links.id_ADW = 'Corophium_volutator'; % ADW
metaData.links.id_Taxo = '34324'; % Taxonomicon
metaData.links.id_WoRMS = '102101'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corophium_volutator}}';   
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
bibkey = 'Birk1977'; type = 'article'; bib = [ ...
'author = {Birklund, J},' ...
'year = {1977}, '...
'title = {Biomass, growth and reproduction of the amphipod \emph{Corophium insidiosum} {C}rawford, and preliminary notes on \emph{Corophium volutatur} ({P}allas)},'...
'pages = {187-203},'...
'journal = {Ophelia},'... 
'volume = {16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoatSmit19797'; type = 'article'; bib = [ ...
'author = {Boats, J. S. and Smith, P. C.},'...
'year = {1979},'...
'title = {Length-weight relationships, energy content and effects of predation on \emph{Corophium volutator} ({P}allas) ({C}rustacea: {A}mphipoda)},'...
'journal = {Proc. N. S. Inst. Sci.},'... 
'volume = {29},'...
'pages = {489--499}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ConrDepl1999'; type = 'article'; bib = [ ...
'author = {Conradi, M. and Depledge, M. H.}, '... 
'year   = {1999}, '... 
'title  = {Effects of zinc on the life-cycle, growth and reproduction of the marine amphipod \emph{Corophium volutator}}, '... 
'journal= {Mar. Ecol. Prog. Ser}, '... 
'volume = {176}, '... 
'pages  = {131-138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FishMill1979'; type = 'article'; bib = [ ...
'author = {Fish, J. D. and Mills, A.}, '... 
'year = {1979}, '...
'title = {The reproductive biology of \emph{Corophium volutator} and \emph{C. arenarium} ({C}rustacea: {A}mphipoda)}, '...
'journal = {J. mar. biol. Ass. U.K.}, '...
'volume = {59}, '...
'pages = {355--368}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hugh1988'; type = 'article'; bib = [ ...
'author = {Hughes, R. G.}, '... 
'year = {1988}, '...
'title = {Dispersal by benthic invertebrates: the in situ swimming behaviour of the amphipods \emph{Corophium volutator}}, '...
'journal = {J. mar. biol. Ass. U.K.}, '... 
'volume = {68}, '...
'pages = {565-579}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeisBick1997'; type = 'article'; bib = [ ...
'author = {Meissner, K. and Bick, A.}, '...
'year = {1997}, '...
'title = {Population dynmaics and ecoparasitological surveys of \emph{Corophium volutator} in coastal waters in the {B}ay of {M}ecklenburg ({S}outhern {B}altic {S}ea)}, '...
'journal = {Diseases of aquatic organisms}, '... 
'volume = {29}, '...
'pages = {169-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MollRose1982'; type = 'article'; bib = [ ...
'author = {Moller, P. and Rosenberg, R.}, '... 
'year = {1979}, '...
'title = {Production and abundance of the amphipod \emph{Corophium volutator} on the {W}est {C}oast of {S}weden}, '...
'journal = {Neth J. Sea Res}, '...
'volume = {16}, '...
'pages = {127-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MollRiis2006'; type = 'article'; bib = [ ...
'author = {Moller, L. F. and Riisgard, H. U.}, '...  
'year = {2006}, '... 
'title = {Filter feeding in the burrowing amphipod \emph{Corophium volutator}}, '... 
'journal = {Mar. Ecol. Prog. Ser}, '... 
'volume = {322}, '... 
'pages = {213-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

