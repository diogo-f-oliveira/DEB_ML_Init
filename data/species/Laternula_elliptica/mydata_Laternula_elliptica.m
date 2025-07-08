function [data, auxData, metaData, txtData, weights] = mydata_Laternula_elliptica

%% set metaData
metaData.phylum     = 'Mollusca';
metaData.class      = 'Bivalvia';
metaData.order      = 'Anomalodesmata';
metaData.family     = 'Laternulidae';
metaData.species    = 'Laternula_elliptica';
metaData.species_en = 'Lantern shell';

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(0.5);

metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'GSI'};
metaData.data_1     = {'t-L'; 'L-Ww'};

metaData.COMPLETE = 2.4;

metaData.author      = {'Bas Kooijman'};
metaData.date_subm   = [2021 02 24]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 24]; 

%% Set zero-variate data;
data.tp   = 365 * 3; units.tp      = 'd'; label.tp      = 'time since birth at puberty';    bibkey.tp = 'guess';
  temp.tp = C2K(0.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am   = 365 * 14; units.am      = 'd'; label.am      = 'life span';            bibkey.am = 'RalpMaxw1977';
  temp.am = C2K(0.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 0.06;  units.Lj = 'cm'; label.Lj = 'shell length at metamorphosis'; bibkey.Lj = 'guess';
data.Li = 9;     units.Li = 'cm'; label.Li = 'ultimate shell length';         bibkey.Li = 'RalpMaxw1977';

data.Wwb = 9e-7; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'KangAhn2009';
  comment.Wwb = 'based on egg diameter of 120 mum: pi/6*0.012^3';

data.GSI  = 0.15; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'guess';   
  temp.GSI = C2K(0.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'GSI = 0.33 for E. arcuatus';

%% Set uni-variate data
%time-length data
data.tL = [ ... % time since settlement (yr), shell length (cm)
0.986	2.389
1.942	3.627
3.105	4.503
4.028	5.526
4.986	6.188
5.910	6.783
6.938	7.182
8.068	7.943
9.062	8.242
10.021	8.525
11.152	8.908
12.215	9.076
13.038	9.293]; 
data.tL(:,1) = 365 * (1 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since settlement', 'shell length'};
temp.tL = C2K(0.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'Inshore data'; 
bibkey.tL = 'RalpMaxw1977';

% length-weight
data.LWw = [ ... % shell length (cm), tissue wet weight (g)
    7.64 31.7
    7.68 32.1
    7.27 26.6
    7.09 26.5
    7.48 27.8
    7.66 30.0
    7.33 28.1
    6.66 24.5
    7.23 30.7
    6.79 24.9
    7.38 36.5
    7.18 28.8
    7.85 32.8
    7.51 29.4
    7.07 25.6
    6.93 23.2
    7.18 25.0
    6.66 21.3
    7.32 30.2
    6.59 26.3
    7.43 36.4];
units.LWw = {'cm', 'g'}; label.LWw = {'shell length','tissue wet weight'};
bibkey.LWw = 'KangAhn2009';

%% Set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% Set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3SHZW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3048832'; % Ency of Life
metaData.links.id_Wiki = 'Laternula_elliptica'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3962554'; % Taxonomicon
metaData.links.id_WoRMS = '197217'; % WoRMS
metaData.links.id_molluscabase = '197217'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Laternula_elliptica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RalpMaxw1977'; type = 'Article'; bib = [ ...
'author = {R. Ralph and J. G. H. Maxwell}, ' ...
'year = {1977}, ' ...
'title = {Growth of Two {A}ntarctic {L}amellibranchs: \emph{Adamussium colbecki} and \emph{Latemula elliptica}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {42}, ' ...
'pages = {171-175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KangAhn2009'; type = 'Article'; bib = [ ...
'doi = {10.1007/s00300-008-0544-7}, ' ...
'author = {Do-Hyung Kang and In-Young Ahn and Kwang-Sik Choi}, ' ...
'year = {2009}, ' ...
'title = {The annual reproductive pattern of the {A}ntarctic clam, \emph{Laternula elliptica} from {M}arian {C}ove, {K}ing {G}eorge {I}sland}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {32}, ' ...
'pages = {517-528}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
