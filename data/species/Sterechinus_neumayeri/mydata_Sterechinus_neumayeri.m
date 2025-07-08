function [data, auxData, metaData, txtData, weights] = mydata_Sterechinus_neumayeri 
  
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Echinidae';
metaData.species    = 'Sterechinus_neumayeri';
metaData.species_en = 'Antarctic sea urchin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.5); % McMurdo average  
metaData.data_0     = {'ab_T'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Ww0'; 'Wdb'; 'Wwi'; 'GSI'};
metaData.data_1     = {'t-Le_T'; 't-L_f'; 't-Wd_f'; 't-JOe'; 'L-Ww'; 'T-JO'};

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Rose Stainthorp'};    
metaData.date_subm = [2015 04 20];              
metaData.email    = {'r.e.stainthorp@noc.soton.ac.uk'};            
metaData.address  = {'National Oceanography Centre, SO14 3ZH, United Kingdom'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 10 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2  = {'Rose Stainthorp'};
metaData.date_mod_2    = [2017 05 23];               
metaData.email_mod_2   = {'r.e.stainthorp@noc.soton.ac.uk'};
metaData.address_mod_2 = {'University of Southampton, England'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 07 06]; 

%% zero-variate data;

data.ab = 21; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'BoscBeau1987';
  temp.ab = C2K(-1.35); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'onset of feeding in pluteus larva'; 
data.ab_T = 17; units.ab_T = 'd'; label.ab_T = 'age at birth'; bibkey.ab_T = 'BoscBeau1987';
  temp.ab_T = C2K(0); units.temp.ab_T = 'K'; label.temp.ab_T = 'temperature';
  comment.ab_T = 'onset of feeding in pluteus larva at warmer temperature'; 
data.tj = 115; units.tj = 'd'; label.tj = 'time since birth at metamorphosis'; bibkey.tj = 'BoscBeau1987';
  temp.tj = C2K(-1.35); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'metamorphosis into benthic juvenile, Bosch counted the days from fertilization!';   
data.am = 40*365; units.am = 'd'; label.am = 'life span'; bibkey.am = 'BreyPear1995';   
  temp.am = C2K(-1.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '40 years is a rough estimate of life span for urchins in the McMurdo sound';
  
% Previous version had 
%   data.tp = 270-21; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'BoscBeau1987';
%   temp.tp = C2K(-1.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
% I can't find this data point - the reference must be wrong, need to check. 
% It doesn't look realistic anyway, is less than a year! too fast.

data.Lb = 0.035; units.Lb = 'cm'; label.Lb = 'length from aboral apex to tips of postoral arms of echinoplutei'; bibkey.Lb = 'BoscBeau1987';  
data.Lj = 0.044; units.Lj = 'cm'; label.Lj = 'diameter of newly metamorphosised benthic juvenile'; bibkey.Lj = 'BoscBeau1987';
data.Lp = 2.04;  units.Lp = 'cm'; label.Lp = 'diameter of test at puberty';                        bibkey.Lp = 'guess';
  comment.Lp = 'Guess based on same relative length compared to Echinus affinis: 7.023 * 1.6/ 5.5';
data.Li = 7.023; units.Li = 'cm'; label.Li = 'ultimate diameter of test'; bibkey.Li = 'BreyPear1995';

% Previous version had 
%   data.Lp = 4.0; units.Lp  = 'mm'; label.Lp = 'test diameter at puberty'; bibkey.Lp = 'BoscBeau1987';
% I can't find this data point - the reference must be wrong, the value is also not realistic. 
% Its gonna be difficult because gonads appear before being mature due to the role with reserves.

data.Wd0 = 4.49e-9; units.Wd0 = 'g'; label.Wd0 = 'CN mass of fertilised egg'; bibkey.Wd0 = 'MarsLeon1999'; 
data.Ww0 = 1.7671e-6; units.Ww0 = 'g'; label.Ww0 = 'wet weight of egg'; bibkey.Ww0 = 'BoscBeau1987';
  comment.Ww0 = 'computed from egg diameter of 0.15 mm (previously reported; 0.179 mm from present experiment: 4/3*pi*0.0075^3';
data.Wdb = 5.21e-9; units.Wdb = 'g'; label.Wdb = 'CN mass of pluteus larva';  bibkey.Wdb = 'MarsLeon1999';
data.Wwi = 129; units.Wwi = 'g'; label.Wwi = 'wet weight adult, including gonads'; bibkey.Wwi = 'PearGies1966';

data.GSI = 0.10; units.GSI = '-'; label.GSI = 'gonadal somatic index'; bibkey.GSI = 'PearGies1966';
  temp.GSI = C2K(-1.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'def: Ww_gonad/Ww_whole; if spawning takes places during summer, we can aproximated from the maximum pre-spawning May of 37% to the next value we have post-spawning of 27%, we may assume one year, this is just an approximation, but I think is closer than the other one, during summer reserves grow so we may be understimating, but then the gonad is not spawned completely';

%% univariate data for embryos (pre-birth)

% time-length data for non-feeding larvae (considered embryos) at different temperatures
data.tLe_T1 = [ ...
  2 5 10 16;               % d, age since fertilisation
  0.21 0.22 0.32 0.35]';   % mm, diameter of larva
units.tLe_T1 = {'days', 'mm'}; label.tLe_T1 = {'age', 'diameter of lava'}; bibkey.tLe_T1 = 'BoscBeau1987';
temp.tLe_T1 = C2K(-1.35); units.temp.tLe_T1 = 'K'; label.temp.tLe_T1 = 'temperature';
comment.tLe_T1 = 'Development time from fertilisation to feeding stage of larva';

data.tLe_T2 = [ ...
  2 4 8 15;                % d, age since fertilisation
  0.21 0.22 0.32 0.35]';   % mm, siameter of larva
units.tLe_T2 = {'days', 'mm'};  label.tLe_T2 = {'age', 'diameter of lava'};  bibkey.tLe_T2 = 'BoscBeau1987';
temp.tLe_T2 = C2K(-0); units.temp.tLe_T2 = 'K'; label.temp.tLe_T2 = 'temperature';
comment.tLe_T2 = 'Development time from fertilisation to feeding stage of larva';

% time-dryWeight data for non-feeding larvae 
% data.tWde = [ ...
%   0 6 16;                 % d, age since fertilisation
%   448.9 495.9 529.4]';    % ng, CN mass
% units.tWde = {'days', 'ng/ind'}; label.tWde = {'Age since fertilisation', 'CN mass'}; bibkey.tWde = 'MarsLeon1999';
% temp.tWde = C2K(-1.5); units.temp.tWde = 'K'; label.temp.tWde = 'temperature';
% comment.tWde = 'Dry weight estimate from CN mass';
% This doesn't make sense! if there is no feeding where is the carbon and nitrogen mass coming from?? 
% Respiration will eliminate carbon but never add; I will avoid this part of Marsh data, respiration may be so low that weight loss is minimum at that time!!?
% Comment Bas: might come from developing larval CaCO3 skeleton, taken from water

% time-dioxygen consumption data for non-feeding larva 
data.tJOe = [ ...
  3 6 11 12 15 16 17 18 20 21 22;    % days, age since fertilisation
  4.013 6.794 8.765 8.414 12.643 13.835 13.75 15.32 15.743 16.643 16.343]';  % pmol/h/ind, O2 consumption
units.tJOe = {'days', 'pmol/h'};  label.tJOe = {'age', 'O_2 consumption'}; bibkey.tJOe = 'MarsLeon1999';
temp.tJOe = C2K(-1.5); units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
comment.tJOe = 'data for ambient food';

%% univariate data for pre-metamorphic larvae

% time-length data for feeding larvae at different food levels
% no food
data.tL_f0 = [ ...
  22 24 26 29 30 33 36 37 40 41 43 45 47;    % d, time since birth
  0.346 0.380 0.404 0.428 0.440 0.502 0.508 0.538 0.546 0.521 0.572 0.583 0.581]';  % mm, length of echinoplutei
units.tL_f0   = {'d', 'mm'};  label.tL_f0 = {'time since birth', 'length of echinoplutei'};  bibkey.tL_f0 = 'MarsLeon1999';
temp.tL_f0   = C2K(-1.5);  units.temp.tL_f0 = 'K'; label.temp.tL_f0 = 'temperature';
comment.tL_f0 = 'Data for no food';
% ambient food
data.tL_fa = [ ...
  22 24 26 29 30 33 35 39 43 47;    % d, time since birth
  0.346 0.380 0.404 0.428 0.440 0.502 0.505 0.518 0.552 0.545]'; % mm, length of echinoplutei
units.tL_fa   = {'d', 'mm'};  label.tL_fa = {'time since birth','length of echinoplutei'};  bibkey.tL_fa = 'MarsLeon1999';
temp.tL_fa = C2K(-1.5);  units.temp.tL_fa = 'K'; label.temp.tL_fa = 'temperature';
comment.tL_fa = 'Data for ambient food';
% abundant food
data.tL_f1 = [ ...
  22 24 26 28 30 33 35 37 39 41 43 45 47;    % d, time since birth
  0.346 0.383 0.417 0.437 0.461 0.522 0.545 0.577 0.588 0.606 0.634 0.640 0.666]';  % mm, Length of echinoplutei
units.tL_f1   = {'d', 'mm'};  label.tL_f1 = {'time since birth', 'length of echinoplutei'};  bibkey.tL_f1 = 'MarsLeon1999';
temp.tL_f1    = C2K(-1.5);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
comment.tL_f1 = 'Data for high food; This data is also quite good'; 

% time-dry weight data for feeding larvae at different food levels
% no food
data.tWd_f0 = [ ... 
  22 33 39 47 51 55;    % d, age since fertilisation
  521.0 548.0 465.1 506.1 381.8 420.1]';  % ng, CN mass 
units.tWd_f0   = {'d', 'ng'};  label.tWd_f0 = {'age', 'CN mass'}; bibkey.tWd_f0 = 'MarsLeon1999';
temp.tWd_f0    = C2K(-1.5);  units.temp.tWd_f0 = 'K'; label.temp.tWd_f0 = 'temperature';
comment.tWd_f0 = 'Data for no food';
% ambient food
data.tWd_fa = [ ...
  22 33 39 49 53 57;    % d, age (since fertilisation)
  521.0 548 465.1 453.8 387.2 360.6]';  % ng, CN mass
units.tWd_fa = {'d', 'ng'}; label.tWd_fa = {'age', 'CN mass'}; bibkey.tWd_fa = 'MarsLeon1999';
temp.tWd_fa = C2K(-1.5);  units.temp.tWd_fa = 'K'; label.temp.tWd_fa = 'temperature';
comment.tWd_fa = 'Data for ambient food';
% comment Bas: strange that dry weight decreases at ambient food
% abundant food
data.tWd_f1 = [ ...
  22 33 39 47 51;    % d, age (since fertilisation)
  521.0 684.2 746.7 784.1 856.1]';  % ng, CN mass
units.tWd_f1 = {'d', 'ng'};  label.tWd_f1 = {'age', 'CN mass'}; bibkey.tWd_f1 = 'MarsLeon1999';
temp.tWd_f1 = C2K(-1.5);  units.temp.tWd_f1 = 'K'; label.temp.tWd_f1 = 'temperature';
comment.tWd_f1 = 'data for abundant food';

% time-dioxygenConsumption data for feeding larva at different food levels
% no food
data.tJO_f0 = [ ...
  24 25 27 29 32 35 36 40 42 47 49 51 55 56 60;    % d, age (since fertilisation)
  16.517 15.086 13.084 12.658 12.937 16.312 16.065 12.176 12.247 12.515 10.228 9.214 15.515 12.004 13.18]';  % pmol/h, O2 consumption
units.tJO_f0 = {'d', 'pmol/h'}; label.tJO_f0 = {'age', 'O_2 consumption'}; bibkey.tJO_f0 = 'MarsLeon1999';
temp.tJO_f0 = C2K(-1.5); units.temp.tJO_f0 = 'K'; label.temp.tJO_f0 = 'temperature';
comment.tJO_f0 = 'Data for no food';
% abundant food
data.tJO_f1 = [ ...
  24 25 27 29 32 35 36 40 42 47 49 51 55 56 60;    % d, age (since fertilisation)
  19.038 18.596 16.189 15.067 24.901 24.639 28.568 27.364 28.13 32.046 28.155 27.346 29.613 31.051 37.065]';  % pmol/h, O2 consumption
units.tJO_f1 = {'d', 'pmol/h'};  label.tJO_f1 = {'age', 'O_2 consumption'}; bibkey.tJO_f1 = 'MarsLeon1999';
temp.tJO_f1 = C2K(-1.5);  units.temp.tJO_f1 = 'K'; label.temp.tJO_f1 = 'temperature';
comment.tJO_f1 = 'Data for abundant food';

%% uni-variate data for post-metam settled stage

% time-Length data for adults collected from the field
data.tL = [ ...
  1556	1556	1556	1921	1921	1921	1921	2286	2286	2286	2286	2652	2652	2652	2652	2652	3017	3017	3017	3017	3017	3017	3382	3382	3382	3382	3382	3747	3747	3747	3747	4113	4113	4113	4113	4113	4478	4478	4478	4478	4478	4843	5208	5208	5574	5574	5939	5939	6304	6304	6669	6669	7035	7035	7400	7400	7765	7765	7765	7765	8496	9226	9226	9226	12878	12878	13609;      % days, age since birth
  44.5	31.9	30.9	36.3	39.7	44.2	32.8	37.9	40.6	48.3	33.5	57.5	54.4	38.7	44.6	32.8	37	52.4	46.6	50.6	39.7	48.3	55.4	41.5	46.5	33.7	48.4	54.9	55.4	44.7	50.6	56.5	53.4	54.5	42.4	39.7	58.5	39.5	63.6	59.5	56.5	64.1	62.3	50.6	54.5	68.2	45.7	49.8	60.5	50.6	57.6	66.3	60.5	63.4	55.5	63.5	63.6	62.5	64.5	59.5	71.9	70.4	62.4	59.5	71.5	64.6	69.6]';   % mm, test diameter
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'days', 'cm'};     label.tL = {'age since birth', 'test diameter'};  bibkey.tL = 'BreyPear1995';
temp.tL = C2K(-1.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'Age data collected from growth bands (annual growth) so f and T = ambient; McMurdo average Temp = -1.5';

% length-wet weight data for adults collected in the field
data.LWw = [ ...
  32.7 30.8 31.8 35.1 34.5 27.0 31.7 34.5 35.9 34.6 40.0 37.2 41.6 37.4 31.6 35.6 37.3 33.2 35.0 35.0 34.0 35.3 38.0 34.4 33.3 41.8 42.3 34.6 35.4 42.1;    % mm, test diameter
  11.86 9.82 10.27 14.58 14.25 7.12 10.37 15.02 15.48 12.71 23.53 17.5 25.29 19.63 10.67 16.7 19.51 14.05 16.87 15.66 15.7 17.13 19.34 15.12 14.24 27.17 25.79 14.66 16.83 25.09]';  % g, wet weight
data.LWw(:,1) = data.LWw(:,1)/ 10; % convert mm to cm
units.LWw   = {'cm', 'g'};  label.LWw = {'test diameter', 'wet weight'};  bibkey.LWw = 'BAS_data';
comment.LWw = 'When and where are these measurements from?';

% dioxygen consumption data per g wet weight at different temperatures at f = 0 during experiments
data.TJO = [ ...
  271.35 273.15 276.15;       % K, temperature during measurement
  2.57 3.24 3.21]';           % muL/h.g, O2 consumption at f and T
units.TJO = {'K', 'muL/h.g'}; label.TJO = {'temperature', 'O_2 consumption per wet weight'}; bibkey.TJO = 'BelmGies1974';
comment.TJO = 'Mean O2 consumption over 4-8hrs from 3 experiments with urchins held at different temperatures during measurement';
% comment Bas: What were the wet weights? 5 g assumed, see pars_init

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = weights.Ww0 * 0; 
weights.Wd0 = weights.Wd0 * 0; 
weights.Wdb = weights.Wdb * 0; 
weights.tJOe = weights.tJOe * 0; 
weights.tWd_f0 = weights.tWd_f0 * 0; 
weights.tWd_fa = weights.tWd_fa * 0; 
weights.tWd_f0 = weights.tWd_f0 * 0; 
weights.tWd_f1 = weights.tWd_f1 * 0; 
weights.tJO_f0 = weights.tJO_f0 * 0; 
weights.tJO_f1 = weights.tJO_f1 * 0; 
weights.TJO = weights.TJO * 0; 
weights.tL = weights.tL * 5; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLe_T2', 'tLe_T1'}; subtitle1 = {'Pre-birth data at 0, -1.35 C'};
set2 = {'tL_f1', 'tL_fa', 'tL_f0'}; subtitle2 = {'Pre-metam data abundant, ambient, no food'};
set3 = {'tWd_f1', 'tWd_fa', 'tWd_f0'}; subtitle3 = {'Pre-metam data abundant, ambient, no food'};
set4 = {'tJO_f1', 'tJO_f0'}; subtitle4 = {'Pre-metam data with abundant, no food'};

metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Larval length growth in absence of food is still positive, possibly due to bacteria and/or organic C in water; change in shape might also contribute';
D2 = 'Bas: Reserve might contribute to length in pre-birth length data';
D3 = 'Bas: notice that Wd0 and Wdb are over-predicted, but Ww0 and t-Wd_f is underpredicted; Ww0/Wd0 = 400! Inconsistent data';
D4 = 'Bas: Wd0, Wdb, respiration and t-Wd_f data are given zero weight in regression';
D5 = 'Bas: refs PearBosc1991 and BelmGies1974 are missing; can you say more about BAS_data?';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F2 = 'Stomadeal breakthrough occurs 20 days after fertilisation at approx. -1.5 degrees celcius - soon after larvae begins feeding';
metaData.bibkey.F2 = 'BoscBeau1987'; 
F3 = 'Mean jaw size/test diameter ratio varies from 0.200 and 0.247';
metaData.bibkey.F3 = 'BreyPear1995'; 
F4 = 'Oogenesis requires ~2 years';
metaData.bibkey.F4 = 'PearBosc1991'; 
F5 = 'Asymptotic test diameter estimates range from 35 to 70.2mm';
metaData.bibkey.F5 = {'Broc2001','BreyPear1995'}; 
F6 = 'Gametogenic cycle lasting 18 to 24 mo, characterised by spawning events in late winter/early summer';
metaData.bibkey.F6 = {'Broc2001'}; 
F7 = 'Spermatogenesis cycle lasts 12 mo, spawning from Nov onwards';
metaData.bibkey.F7 = {'Broc2001'}; 
metaData.facts = struct('F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6,'F7',F7);

%% Links
metaData.links.id_CoL = '52DNV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3039430'; % Ency of Life
metaData.links.id_Wiki = 'Sterechinus_neumayeri'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3927856'; % Taxonomicon
metaData.links.id_WoRMS = '160831'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sterechinus_neumayeri}}';
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
bibkey = 'BoscBeau1987'; type = 'Article'; bib = [ ... 
'author = {Bosch, I. and Beauchamp, K. A. and Steele, E. and Pearse, J. S.}, ' ... 
'year = {1987}, ' ...
'title = {Development, metamorphosis and seasonal abundance of embryos and larvae of the {A}ntarctic sea urchin \emph{Sterechinus neumayeri}}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {173}, ' ...
'pages = {126--135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BreyPear1995'; type = 'Article'; bib = [ ... 
'author = {Brey, T. and Pearse, J. and Basch, L. and McClintock, J.}, ' ... 
'year = {1995}, ' ...
'title = {Growth and production of \emph{Sterechinus neumayeri} ({E}chonidea: {E}chinodermata) in {M}c{M}urdo {S}ound, {A}ntarctica}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {124}, ' ...
'pages = {279--292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Broc2001'; type = 'Phdthesis'; bib = [ ... 
'author = {Brockington, S.}, ' ... 
'year = {2001}, ' ...
'title = {The seasonal ecology and physiology of \emph{Sterechinus neumayeri} ({E}chinodermata: {E}chinoidea) at {A}delaide {I}sland, {A}ntarctica}, ' ...
'school = {British Antarctic Survey, Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarsLeon1999'; type = 'Article'; bib = [ ... 
'author = {Marsh, A. G. and Leong, P. K. and Manahan, D. T.}, ' ... 
'year = {1999}, ' ...
'title = {Energy metabolism during embryonic development and larval growth of an {A}ntarctic sea urchin}, ' ...
'journal = {The journal of Experimental Biology}, ' ...
'volume = {202}, ' ...
'pages = {2041--2050}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PearGies1966'; type = 'Article'; bib = [ ... 
'author = {Pearse, J. S. and Giese, A. C.}, ' ... 
'year = {1966}, ' ...
'title = {Food, reproduction and organic constitution of the common {A}ntarctic echinoid \emph{Sterechinus neumayeri} ({M}eissner)}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {130}, ' ...
'number = {3}, '...
'pages = {387--401}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BAS_data'; type = 'Misc'; bib = ...
'howpublished = {unpublished data}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PearBosc1991'; type = 'Article'; bib = [ ... 
'author = {Pearse, J. S. and Bosch, I. and Pearse,  V. B. and Basch, l. V.}, ' ... 
'year = {1991}, ' ...
'title = {Differences in feeding on algae and bacteria by temperate and {A}ntarctic sea star larvae}, ' ...
'journal = {Antarctic Journal of the United States}, ' ...
'volume = {26}, ' ...
'pages = {170--172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BelmGies1974'; type = 'Article'; bib = [ ... 
'author = {Belman and Giese}, ' ... 
'year = {1974}, ' ...
'title = {Oxygen consumption of an asteroid and an echinoid from the {A}ntarctic}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {146}, ' ...
'pages = {157--164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
