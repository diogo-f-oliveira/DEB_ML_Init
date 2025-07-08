function [data, auxData, metaData, txtData, weights] = mydata_Mysis_mixta

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Mysis_mixta'; 
metaData.species_en = 'mysid shrimp'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L', 't-Wd', 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Caroline Ek'};                            
metaData.date_subm = [2015 04 27];                            
metaData.email    = {'caroline.ek@aces.su.se'};                  
metaData.address  = {'Stockholm University, Department of Environmental Science and Analytical Chemistry (ACES), SE-106 91, Sweden'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 09]; 

%% set data
% zero-variate data

data.ab = 106;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'GoroHans2000';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 180;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GoroHans2000';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 360;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'GoroHans2000';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.61;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GoroHans2000';
  comment.Lb = 'all lengths are between tip of the rostrum to the posterioredge of the last abdominal segment at birth';
data.Lp  = 1.16;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'GoroHans2000';
data.Li  = 1.66;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'GoroHans2000';

data.Wdb = 5.2e-4;  units.Wdb = 'g'; label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'GoroHans2000';
data.Wdp = 2.43e-3; units.Wdp = 'g'; label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'GoroHans2000';
data.Wdi = 9.65e-3; units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'GoroHans2000';

data.Ri  = 0.1;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Goro1998';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data


% t-L data
data.tL = [ ... % time (d), length (cm)
0	0	0	7	7	7	14	14	14	21	21	21	28	28	28	35	35	42	42	42	49	49	49	56	56	56	63	63	63	70	70	70	77	77	77	84	84	91	91;    % time since birth
1.06	0.93	0.91	0.91704	0.92	1.0957	0.857	1.1018	1.1563	1.048664	1.013021	1.131831	1.067812984	1.140593	1.083761088	0.98791462	1.104681088	1.148483392	0.992127308	1.002887405	1.292686119	1.159960669	1.089252086	1.169102386	1.161447695	1.036727846	1.323645323	1.180943015	1.190682928	1.264218421	1.370317802	1.255494009	1.129687522	1.343490195	1.21564455	1.31420927	1.270258652	1.474970209	1.334391943]';  % physical length at f and T
units.tL   = {'d', 'cm'};  label.tL = {'time', 'length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GoroHans2000';

% t-W data
data.tW = [ ... % time (d), dry weight (g)
 0	0	0	7	7	7	14	14	14	21	21	21	28	28	28	35	35	42	42	42	49	49	49	56	56	56	63	63	63	70	70	70	77	77	77	84	84	91	91;    % time since birth
 0.002649604	0.001824886	0.001715249	0.001753339	0.001769516	0.002911927	0.001445622	0.002958368	0.003394769	0.002569644	0.002328476	0.003194014	0.002705644	0.003264989	0.002822409	0.002167752	0.002980468	0.003329774	0.002194201	0.002262705	0.004664602	0.003425489	0.002863355	0.003502991	0.003438019	0.002487161	0.00499009	0.003605054	0.003690441	0.004377763	0.005508077	0.00429221	0.003176805	0.005206281	0.003915237	0.004889373	0.004437639	0.006793468	0.005106425]';  % g, dry weight at f and T
units.tW   = {'d', 'g'};  label.tW = {'time', 'dry weight'};  
temp.tW    = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GoroHans1999';

% L-W data
data.LW = [ ... % length (cm), dry weight (g)
1.06	0.93	0.91	0.91704	0.92	1.0957	0.857	1.1018	1.1563	1.048664	1.013021	1.131831	1.067812984	1.140593	1.083761088	0.98791462	1.104681088	1.148483392	0.992127308	1.002887405	1.292686119	1.159960669	1.089252086	1.169102386	1.161447695	1.036727846	1.323645323	1.180943015	1.190682928	1.264218421	1.370317802	1.255494009	1.129687522	1.343490195	1.21564455	1.31420927	1.270258652	1.474970209	1.334391943;      % cm, snout-to-vent length at f
0.002649604	0.001824886	0.001715249	0.001753339	0.001769516	0.002911927	0.001445622	0.002958368	0.003394769	0.002569644	0.002328476	0.003194014	0.002705644	0.003264989	0.002822409	0.002167752	0.002980468	0.003329774	0.002194201	0.002262705	0.004664602	0.003425489	0.002863355	0.003502991	0.003438019	0.002487161	0.00499009	0.003605054	0.003690441	0.004377763	0.005508077	0.00429221	0.003176805	0.005206281	0.003915237	0.004889373	0.004437639	0.006793468	0.005106425]';   % g, dry weight at f and T
units.LW   = {'cm', 'g'};  label.LW = {'length', 'dry weight'};  
bibkey.LW = 'GoroHans1999';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7454Q'; % Cat of Life
metaData.links.id_ITIS = '90601'; % ITIS
metaData.links.id_EoL = '318325'; % Ency of Life
metaData.links.id_Wiki = 'Mysis'; % Wikipedia
metaData.links.id_ADW = 'Mysis_mixta'; % ADW
metaData.links.id_Taxo = '477445'; % Taxonomicon
metaData.links.id_WoRMS = '120113'; % WoRMS


%% References
bibkey = 'WORMS'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marinespecies.org/aphia.php?p=taxdetails&id=120113}}';
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
bibkey = 'GoroHans2000'; type = 'Article'; bib = [ ... 
'author = {Gorokhova, E. and Hansson, S.}, ' ... 
'year = {2000}, ' ...
'title = {Elemental composition of \emph{Mysis mixta} ({C}rustacea, {M}ysidacea) and energy costs of reproduction and embryogenesis under laboratory conditions}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {246}, ' ...
'pages = {103--123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GoroHans1999'; type = 'Article'; bib = [ ... 
'author = {Gorokhova, E. and Hansson, S.}, ' ... 
'year = {1999}, ' ...
'title = {An experimental study on variations in stable carbon and nitrogen isotope fractionation during growth of \emph{Mysis mixta} and \emph{Neomysis integer}}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {56}, ' ...
'pages = {2203--2210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Goro1998'; type = 'Article'; bib = [ ... 
'author = {Gorokhova, E.}, ' ... 
'year = {1998}, ' ...
'title = {Exploring and modeling the growth dynamics of \emph{Mysis mixta}}, ' ...
'journal = {Ecological Modelling}, ' ...
'volume = {110}, ' ...
'pages = {45--54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

