function [data, auxData, metaData, txtData, weights] = mydata_Cyprogenia_stegaria
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Cyprogenia_stegaria'; 
metaData.species_en = 'Fanshell'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'};
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 06];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 26*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoneNeve2002';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'JoneNeve2002'; 
data.Li  = 5.6;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'JoneNeve2002';

data.Wwi  = 6.3; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(5.6/7.3)^3';
  
% uni-variate data
  
% time-length
data.tL = [ ... % time since settlement (yr), shell length (cm)
    0 0.021
    1 0.71
    2 1.19
    3 1.65
    4 2.21
    5 2.70
    6 3.43
    7 3.75
    8 3.86
    9 3.75
   10 4.09
   11 4.23
   12 4.09
   13 4.67
   14 4.37
   15 4.88
   16 4.84
   17 4.26
   18 4.52
   19 5.06
   20 5.40
   21 5.04
   22 5.39
   23 5.06
   24 5.00
   25 5.12
   26 5.60];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoneNeve2002';
comment.tL = 'Data from Clinch River, Hancock County, Tennessee; mean temperature is guessed';

% length-fecundity
data.LN = [ ... % shell length (cm), fecundity (#)
     3.73 24999
     4.82 63544
     4.72 63011
     3.46 22393];
units.LN = {'cm', '#'}; label.LN = {'shell length','fecundity'};  
temp.LN = C2K(17);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'JoneNeve2002';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.p_M = 0;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '33J8T'; % Cat of Life
metaData.links.id_ITIS = '80277'; % ITIS
metaData.links.id_EoL = '403085'; % Ency of Life
metaData.links.id_Wiki = 'Cyprogenia_stegaria'; % Wikipedia
metaData.links.id_ADW = 'Cyprogenia_stegaria'; % ADW
metaData.links.id_Taxo = '344286'; % Taxonomicon
metaData.links.id_WoRMS = '857258'; % WoRMS
metaData.links.id_molluscabase = '857258'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyprogenia_stegaria}}';
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
bibkey = 'JoneNeve2002'; type = 'Article'; bib = [ ...
'author = {Jess W. Jones and Richard J. Neves and Steven A. Ahlstedt and Rachel A. Mair}, ' ... 
'year = {2002}, ' ...
'title = {Life history and propagation of the endangered fanshell pearlymussel, \emph{Cyprogenia stegaria} {R}afinesque ({B}ivalvia: {U}nionidae)}, ' ...
'journal = {J. N. Am. Benthol. Soc.}, ' ...
'volume = {21(1)}, ' ...
'pages = {76-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
