
function [data, auxData, metaData, txtData, weights] = mydata_Dromus_dromas
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Dromus_dromas'; 
metaData.species_en = 'Dromedary pearlymussel'; 

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
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoneNeve2004';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 7.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'JoneNeve2004';

data.Wwi  = 15.1; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(7.5/7.3)^3';
  
% uni-variate data
  
% time-length
data.tL = [ ... % time since settlement (yr), shell length (cm)
    0 0.026
    1 0.75
    2 1.30
    3 2.81
    4 2.96
    5 3.362
    6 3.42
    7 4.15
    8 4.45
    9 4.59
   10 4.93
   11 5.63
   12 4.69
   14 5.93
   15 5.95
   16 6.09
   17 6.00
   18 6.12
   19 6.34
   20 6.72
   25 7.50];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoneNeve2004';
comment.tL = 'Data from Clinch River; mean temperature is guessed';

% length-fecundity
data.LN = [ ... % shell length (cm), fecundity (#)
     6.20 253050
     5.32 120540
     6.41  98384
     5.45  55110
     5.10  48267
     6.10 118912
     5.60  64408];
units.LN = {'cm', '#'}; label.LN = {'shell length','fecundity'};  
temp.LN = C2K(17);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'JoneNeve2004';


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
metaData.links.id_CoL = '6DKCH'; % Cat of Life
metaData.links.id_ITIS = '80245'; % ITIS
metaData.links.id_EoL = '402777'; % Ency of Life
metaData.links.id_Wiki = 'Dromus_dromas'; % Wikipedia
metaData.links.id_ADW = 'Dromus_dromas'; % ADW
metaData.links.id_Taxo = '361818'; % Taxonomicon
metaData.links.id_WoRMS = '857260'; % WoRMS
metaData.links.id_molluscabase = '857260'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dromus_dromas}}';
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
bibkey = 'JoneNeve2004'; type = 'Article'; bib = [ ...
'author = {Jess W. Jones and Richard J. Neves and Steven A. Ahlstedt and Rachel A. Mair}, ' ... 
'year = {2004}, ' ...
'title = {Life history and propagation of the endangered dromedary pearlymussel (\emph{Dromus dromas}) ({B}ivalvia: {U}nionidae)}, ' ...
'journal = {J. N. Am. Benthol. Soc.}, ' ...
'volume = {23(3)}, ' ...
'pages = {515-525}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

